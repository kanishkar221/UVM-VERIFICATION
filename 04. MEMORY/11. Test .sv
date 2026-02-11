class ram_test extends uvm_test;
  
  `uvm_component_utils(ram_test)
  
  ram_env env;
  ram_sequence seq;
  
  function new(string name = "ram_test",uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ram_env::type_id::create("env",this);
    seq = ram_sequence::type_id::create("seq");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    #100;
    phase.drop_objection(this);
  endtask
  
endclass
