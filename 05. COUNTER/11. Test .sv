class counter_test extends uvm_test;
  
  `uvm_component_utils(counter_test)
  
  counter_env env;
  counter_sequence seq;
  
  function new(string name = "counter_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    env = counter_env::type_id::create("env",this);
    seq = counter_sequence::type_id::create("seq");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    #100;
    phase.drop_objection(this);
  endtask
  
endclass
  
