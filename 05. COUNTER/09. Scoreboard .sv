class counter_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(counter_scoreboard)
  
  uvm_analysis_imp #(counter_seq_item, counter_scoreboard) sb_imp;
  
  bit [3:0] exp_count;
  
  function new(string name = "counter_scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp = new("sb_imp",this);
    exp_count = 0;
  endfunction
  
  function void write(counter_seq_item item);
    
    if (item.reset)
      exp_count = 0;
    else if (item.enable)
      exp_count = exp_count + 1;
    else
      exp_count = exp_count;
    
    if(item.count == exp_count)
      `uvm_info("SB",$sformatf("PASS ----> reset=%0b  enable=%0b  Actual count=%0d  Expected count=%0d", item.reset, item.enable,  item.count, exp_count),UVM_LOW)
    else
      `uvm_error("SB",$sformatf("FAIL ----> reset=%0b  enable=%0b  Actual count=%0d Expected count=%0d", item.reset, item.enable, item.count, exp_count))
      $display("----------------------------------------------------------------");
  endfunction
  
endclass   
    
