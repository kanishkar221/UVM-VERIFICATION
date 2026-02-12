class counter_sequence extends uvm_sequence #(counter_seq_item);
  
  `uvm_object_utils(counter_sequence)
  
  function new (string name = "counter_sequence");
    super.new(name);
  endfunction
  
  task body();
    counter_seq_item req;
    `uvm_info("SEQ", "Sequence starts",UVM_LOW)
    repeat(10)begin
      req = counter_seq_item::type_id::create("req");
      `uvm_do(req)
    end
  endtask
  
endclass
  
