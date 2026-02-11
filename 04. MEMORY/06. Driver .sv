class ram_driver extends uvm_driver#(ram_seq_item);
  
  virtual ram_if vif;
  ram_seq_item req;
  
  `uvm_component_utils(ram_driver)
  
  function new(string name = "ram_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual ram_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Interface not found in driver");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      req = ram_seq_item::type_id::create("req");
      seq_item_port.get_next_item(req);
      @(negedge vif.clk);
      vif.wr <= req.wr;
      vif.d_in <= req.d_in;
      vif.addr <= req.addr;
      #5;
      seq_item_port.item_done();
    end
  endtask
  
endclass
