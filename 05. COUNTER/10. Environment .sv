class counter_env extends uvm_env;
  
  `uvm_component_utils(counter_env)
  
  counter_agent agent;
  counter_scoreboard sb;
  
  function new(string name = "counter_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("ENV", "Environment Created",UVM_LOW)
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agent = counter_agent::type_id::create("agent",this);
    sb = counter_scoreboard::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.mon_ap.connect(sb.sb_imp);
  endfunction
  
endclass
    
