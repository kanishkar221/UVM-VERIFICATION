class ram_env extends uvm_env;
  
  `uvm_component_utils(ram_env)
  
  ram_agent agent;
  ram_scoreboard sb;
  
  function new(string name = "ram_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV","Environment Created",UVM_LOW)
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agent = ram_agent::type_id::create("agent",this);
    sb = ram_scoreboard::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.mon_ap.connect(sb.sb_imp);
  endfunction
  
endclass
