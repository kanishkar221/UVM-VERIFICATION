import uvm_pkg::*;          
`include "uvm_macros.svh"

`include "interface.sv"
`include "FA_seq_item.sv"
`include "FA_sequence.sv"
`include "FA_sequencer.sv"
`include "FA_driver.sv"
`include "FA_monitor.sv"
`include "FA_agent.sv"
`include "FA_scoreboard.sv"
`include "FA_env.sv"
`include "FA_test.sv"

module top;
  
  FA_if vif();
  
  FA dut(.a(vif.a),
         .b(vif.b),
         .cin(vif.cin),
         .sum(vif.sum),
         .cout(vif.cout)
        );
  
  initial begin
    uvm_config_db#(virtual FA_if)::set(null,"*","vif",vif);
    run_test ("FA_test");
  end
  
  initial begin
    $dumpfile("FA_UVM.vcd");
    $dumpvars;
    #100;
    $finish;
  end
  
endmodule
