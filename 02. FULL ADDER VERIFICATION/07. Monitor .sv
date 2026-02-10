class FA_monitor extends uvm_monitor;
  
  `uvm_component_utils(FA_monitor)
  
  virtual FA_if vif;
  FA_seq_item item;
  
  uvm_analysis_port #(FA_seq_item)mon_ap;
  
  function new(string name = "FA_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap = new("mon_ap",this); 
    if(!uvm_config_db #(virtual FA_if)::get(this,"","vif",vif))
      `uvm_fatal("MONITOR","Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      #10;
      item = FA_seq_item::type_id::create("item");
      item.a = vif.a;
      item.b = vif.b;
      item.cin = vif.cin;
      item.sum = vif.sum;
      item.cout = vif.cout;
      
      mon_ap.write(item);
    end
  endtask
    
endclass
