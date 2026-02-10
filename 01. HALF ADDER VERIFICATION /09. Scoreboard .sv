class ha_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(ha_scoreboard)
  
  uvm_analysis_imp #(ha_seq_item,ha_scoreboard) sb_imp;
  
  function new(string name = "ha_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp = new("sb_imp",this);
  endfunction
  
  function void write(ha_seq_item item);
    bit exp_sum;
    bit exp_carry;
    
    exp_sum = item.a ^ item.b;
    exp_carry = item.a & item.b; 
    
    if((exp_sum == item.sum) && (exp_carry == item.carry))
      `uvm_info("SB",$sformatf("PASS----> INPUT:a=%0d | b=%0d | Actual output: sum=%0d | carry=%0b || Expected output:sum=%0d | carry=%0b",item.a,item.b,item.sum,item.carry,exp_sum,exp_carry),UVM_LOW)
    else
      `uvm_error("SB",$sformatf("FAIL----> INPUT:a=%0d | b=%0d | Actual output: sum=%0d |carry=%0b || Expected output:sum=%0d |carry=%0b",item.a,item.b,item.sum,item.carry,exp_sum,exp_carry))
  endfunction
  
endclass     
