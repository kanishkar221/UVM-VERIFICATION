class FA_env extends uvm_env;
  
  `uvm_component_utils(FA_env)
  
  FA_agent agent;
  FA_scoreboard sb;
  
  function new(string name = "FA_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV", "Environment Created", UVM_LOW)
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    agent = FA_agent:: type_id ::create("agent",this);
    sb = FA_scoreboard::type_id:: create("sb",this);
  endfunction
  
  function void  connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.mon_ap.connect(sb.sb_imp);
  endfunction
  
endclass
