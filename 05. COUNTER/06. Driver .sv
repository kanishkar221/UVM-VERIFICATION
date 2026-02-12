class counter_driver extends uvm_driver #(counter_seq_item);
  
  `uvm_component_utils(counter_driver)
  
  counter_seq_item req;
  virtual counter_if vif;
  
  function new(string name = "counter_driver",uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual counter_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual Interface not found")
  endfunction
      
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      req = counter_seq_item::type_id::create("req");
      seq_item_port.get_next_item(req);
      @(negedge vif.clk);
      vif.enable = req.enable;
      seq_item_port.item_done();
    end
  endtask
    
endclass
    
