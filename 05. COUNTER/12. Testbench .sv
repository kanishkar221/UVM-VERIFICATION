import uvm_pkg::*;
`include "uvm_macros.svh"

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

module top;
  counter_if vif();
  
  counter dut(.clk(vif.clk),
              .reset(vif.reset),
              .enable(vif.enable),
              .count(vif.count)
             );
  
  initial begin
    uvm_config_db #(virtual counter_if)::set(null,"*","vif",vif);
    run_test("counter_test");
  end
  
  always #5 vif.clk = ~vif.clk;
  
  initial begin
    $dumpfile("counter_uvm.vcd");
    $dumpvars;
    vif.clk = 0;
    vif.reset = 1;
    vif.enable = 0;
    #10; vif.reset = 0;
    #150;
    $finish;
  end
endmodule
  
