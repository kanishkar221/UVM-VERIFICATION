class dff_driver extends uvm_driver#(dff_seq_item);
  
  `uvm_component_utils(dff_driver)
  
  virtual dff_if vif;
  
  dff_seq_item req;
  
  function new(string name = "dff_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db  #(virtual dff_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual interface not found");
  endfunction
      
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      req = dff_seq_item::type_id::create("req");
      seq_item_port.get_next_item(req);
      @(negedge vif.clk);
      vif.reset <= req.reset;
      vif.d <= req.d;
      #5;
      seq_item_port.item_done();
    end
  endtask
  
endclass  
   
