class ha_env extends uvm_env;
  
  `uvm_component_utils(ha_env)
  
  ha_agent agent;
  ha_scoreboard sb;
  
  function new(string name = "ha_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV", "Environment Created", UVM_LOW)
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agent = ha_agent:: type_id ::create("agent",this);
    sb = ha_scoreboard::type_id:: create("sb",this);
  endfunction
  
  function void  connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.mon_ap.connect(sb.sb_imp);
  endfunction
  
endclass
