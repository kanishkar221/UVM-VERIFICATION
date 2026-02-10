class FA_sequencer extends uvm_sequencer #(FA_seq_item);
  
  `uvm_component_utils(FA_sequencer)
  
  function new(string name = "FA_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
