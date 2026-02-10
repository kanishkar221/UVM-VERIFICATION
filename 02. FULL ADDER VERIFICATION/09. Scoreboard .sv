class FA_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(FA_scoreboard)
  
  uvm_analysis_imp #(FA_seq_item,FA_scoreboard) sb_imp;
  
  function new(string name = "FA_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp = new("sb_imp",this);
  endfunction
  
  function void write(FA_seq_item item);
    bit exp_sum;
    bit exp_cout;
    
    exp_sum = item.a ^ item.b ^ item.cin;
    exp_cout = (item.a & item.b) | (item.b & item.cin) | (item.cin & item.a);
    
    
    if((exp_sum == item.sum) && (exp_cout == item.cout))
      `uvm_info("SB",$sformatf("PASS----> INPUT:a=%0d | b=%0d | cin=%0d | Actual output: sum=%0d | cout=%0b || Expected output:sum=%0d |cout=%0b",item.a,item.b,item.cin,item.sum,item.cout,exp_sum,exp_cout),UVM_LOW)
    else
      `uvm_error("SB",$sformatf("FAIL----> INPUT:a=%0d |b=%0d|cin=%0d|Actual output: sum=%0d |cout=%0b || Expected output:sum=%0d |cout=%0b",item.a,item.b,item.cin,item.sum,item.cout,exp_sum,exp_cout))
  endfunction
  
endclass     
