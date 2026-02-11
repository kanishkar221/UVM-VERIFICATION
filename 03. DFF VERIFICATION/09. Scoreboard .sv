class dff_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(dff_scoreboard)
  
  uvm_analysis_imp #(dff_seq_item,dff_scoreboard) sb_imp;
  
  function new(string name = "scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp = new("sb_imp",this);
  endfunction
  
  function void write(dff_seq_item item);
    bit exp_q;
    
    if (item.reset)
      exp_q = 0;
    else 
      exp_q = item.d;
    
    if(item.q == exp_q)
      `uvm_info("SB",$sformatf("PASS ----->  reset=%0d  d=%0d  Actual q=%0d || Expected q=%0d", item.reset, item.d, item.q, exp_q),UVM_LOW)
      
    else
      `uvm_error("SB",$sformatf("FAIL -----> reset=%0d  d=%0d  Actual q=%0d  || Expected q=%0d", item.reset, item.d, item.q, exp_q))
  endfunction
      
endclass
       
