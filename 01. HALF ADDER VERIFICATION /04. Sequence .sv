class ha_sequence extends uvm_sequence #(ha_seq_item);
  
  `uvm_object_utils(ha_sequence)
  
  function new(string name = "ha_sequence");
    super.new(name);
  endfunction
  
  task body();
    ha_seq_item req;
    `uvm_info("SEQ", "Sequence starts", UVM_LOW)
    repeat(10)begin
      req = ha_seq_item::type_id::create("req");
      `uvm_do(req)
    end
  endtask
  
endclass      
