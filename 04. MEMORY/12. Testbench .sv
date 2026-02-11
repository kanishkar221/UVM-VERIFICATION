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
  ram_if vif();
  
  ram dut(.clk(vif.clk),
          .wr(vif.wr),
          .d_in(vif.d_in),
          .addr(vif.addr),
          .d_out(vif.d_out)
         );
  
  initial begin
    uvm_config_db #(virtual ram_if)::set(null,"*","vif",vif);
    run_test ("ram_test");
  end
  
  always #5 vif.clk = ~vif.clk;
  
  initial begin
    $dumpfile("ram_uvm.vcd");
    $dumpvars;
    vif.clk = 0;
    #200;
    $finish;
  end
  
endmodule
    
