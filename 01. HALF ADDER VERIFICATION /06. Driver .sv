class ha_driver extends uvm_driver #(ha_seq_item);
  
  `uvm_component_utils(ha_driver)
  ha_seq_item req;
  
  virtual ha_if vif;

  function new(string name = "ha_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual ha_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      req = ha_seq_item::type_id::create("req");
      seq_item_port.get_next_item(req);
      vif.a = req.a;
      vif.b = req.b;
      #10;
      seq_item_port.item_done();
    end
  endtask
    
endclass  
