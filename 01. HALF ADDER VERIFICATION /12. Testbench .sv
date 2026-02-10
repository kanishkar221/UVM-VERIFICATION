import uvm_pkg::*;
`include "uvm_macros.svh"

`include "interface.sv"
`include "ha_seq_item.sv"
`include "ha_sequence.sv"
`include "ha_sequencer.sv"
`include "ha_driver.sv"
`include "ha_monitor.sv"
`include "ha_scoreboard.sv"
`include "ha_agent.sv"
`include "ha_env.sv"
`include "ha_test.sv"


module top;
  
  ha_if vif();
  
  ha dut (.a(vif.a),
          .b(vif.b),
          .sum(vif.sum),
          .carry(vif.carry)
         );
  
  initial begin
    uvm_config_db #(virtual ha_if)::set(null,"*","vif",vif);
    run_test("ha_test");
  end
  
  initial begin
    $dumpfile("ha_UVM.vcd");
    $dumpvars();
    #100;
    $finish;
  end
  
endmodule  
