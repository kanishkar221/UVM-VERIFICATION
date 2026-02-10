class ha_agent extends uvm_agent;
  
  `uvm_component_utils(ha_agent)
  
  ha_driver driver;
  ha_monitor monitor;
  ha_sequencer sequencer;
  
  function new(string name = "ha_Agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sequencer = ha_sequencer:: type_id :: create("sequencer", this); 
    driver = ha_driver::type_id::create("driver",this);
    monitor = ha_monitor:: type_id :: create("monitor",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
  
endclass
