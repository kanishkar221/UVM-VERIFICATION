class ha_monitor extends uvm_monitor;
  
  `uvm_component_utils(ha_monitor)
  
  virtual ha_if vif;
  ha_seq_item item;
  
  uvm_analysis_port #(ha_seq_item)mon_ap;
  
  function new(string name = "ha_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap = new("mon_ap",this); 
    if(!uvm_config_db #(virtual ha_if)::get(this,"","vif",vif))
      `uvm_fatal("MONITOR","Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      #10;
      item = ha_seq_item::type_id::create("item");
      item.a = vif.a;
      item.b = vif.b;
      item.sum = vif.sum;
      item.carry = vif.carry;
      mon_ap.write(item);
    end
  endtask
    
endclass
