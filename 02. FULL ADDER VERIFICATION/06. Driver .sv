class FA_driver extends uvm_driver #(FA_seq_item);
  
  `uvm_component_utils(FA_driver)
  FA_seq_item req;
  
  virtual FA_if vif;

  function new(string name = "FA_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual FA_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      req = FA_seq_item::type_id::create("req");
      seq_item_port.get_next_item(req);
      vif.a = req.a;
      vif.b = req.b;
      vif.cin = req.cin;
      #10;
      seq_item_port.item_done();
    end
  endtask
    
endclass
  
