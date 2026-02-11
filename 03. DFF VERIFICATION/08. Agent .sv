class dff_agent extends uvm_agent;
  
  `uvm_component_utils(dff_agent)
  
  dff_driver driver;
  dff_monitor monitor;
  dff_sequencer sequencer;
  
  function new(string name = "Agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sequencer = dff_sequencer::type_id:: create("sequencer", this);    
    driver = dff_driver::type_id::create("driver",this);
    monitor = dff_monitor:: type_id :: create("monitor",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
  
endclass
  
