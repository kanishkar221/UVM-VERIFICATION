class ram_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(ram_scoreboard)
  
  uvm_analysis_imp #(ram_seq_item,ram_scoreboard) sb_imp;
  
  bit[7:0] temp[15:0];
  
  function new(string name = "ram_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp = new("sb_imp",this);
  endfunction
  
  function void write(ram_seq_item item);
    bit [7:0] exp_d_out;
    
    if(item.wr) begin
      temp[item.addr] = item.d_in;
      `uvm_info("SB",$sformatf("WRITE PASS -----> Input:clk=%0b  wr=%0b  d_in=%0d addr=%0d  d_out=%0d",item.clk, item.wr, item.d_in, item.addr, item.d_out),UVM_LOW)
    end
    else begin
      exp_d_out = temp[item.addr];
      
      if(exp_d_out == item.d_out)
        `uvm_info("SB",$sformatf("PASS ---> Input:clk=%0b  wr=%0b  d_in=%0d  addr=%0d  Actual Output: d_out=%0d || Expected Output: exp_d_out=%0d",item.clk, item.wr, item.d_in, item.addr, item.d_out, exp_d_out),UVM_LOW)
      else
        `uvm_error("SB",$sformatf("FAIL ---> Input:clk=%0b  wr=%0b  d_in=%0d  addr=%0d  Actual Output: d_out=%0d || Expected Output: exp_d_out=%0d",item.clk, item.wr, item.d_in, item.addr, item.d_out, exp_d_out))
      end
  endfunction
        
endclass
