class ram_sequence extends uvm_sequence#(ram_seq_item);
  
  `uvm_object_utils(ram_sequence)
  
  function new(name = "ram_sequence");
    super.new(name);
  endfunction
  
  task body();
    ram_seq_item req;
    `uvm_info ("SEQ","Sequence Starts",UVM_LOW)
    repeat(20)begin
      req = ram_seq_item::type_id::create("req");
      `uvm_do(req)
    end
  endtask
  
endclass
