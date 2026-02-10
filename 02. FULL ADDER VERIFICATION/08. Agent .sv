class FA_agent extends uvm_agent;
  
  `uvm_component_utils(FA_agent)
  
  FA_driver driver;
  FA_monitor monitor;
  FA_sequencer sequencer;
  
  function new(string name = "FA_Agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sequencer = FA_sequencer:: type_id :: create("sequencer", this); 
    driver = FA_driver::type_id::create("driver",this);
    monitor = FA_monitor:: type_id :: create("monitor",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
  
endclass
