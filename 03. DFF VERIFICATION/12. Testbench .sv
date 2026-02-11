import uvm_pkg::*;          
`include "uvm_macros.svh"

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  
  dff_if vif();
  
  dff dut(
    .clk(vif.clk),
    .reset(vif.reset),
    .d(vif.d),
    .q(vif.q)
  );
  
  initial begin
    uvm_config_db#(virtual dff_if)::set(null,"*","vif",vif);
    run_test ("dff_test");
  end
  
  always #5 vif.clk = ~vif.clk;
  
  initial begin
    $dumpfile("dff_UVM.vcd");
    $dumpvars;
    vif.clk=0;
    #300;
    $finish;
  end
  
endmodule
