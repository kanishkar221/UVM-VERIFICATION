class dff_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(dff_seq_item)
  
  rand bit reset;
  rand bit d;
  bit q;
  
  function new(string name = "dff_seq_item");
    super.new(name);
  endfunction
  
  constraint c1 {reset dist{ 0:=5 , 1:=5};}
  constraint c2 {d dist{ 0:=5 , 1:=5};}
  
endclass
  
