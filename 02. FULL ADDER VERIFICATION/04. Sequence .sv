class FA_sequence extends uvm_sequence #(FA_seq_item);
  
  `uvm_object_utils(FA_sequence)
  
  function new(string name = "FA_sequence");
    super.new(name);
  endfunction
  
  task body();
    FA_seq_item req;
    `uvm_info("SEQ", "Sequence starts", UVM_LOW)
    repeat(10)begin
      req = FA_seq_item::type_id::create("req");
      `uvm_do(req)
    end
  endtask
  
endclass      
