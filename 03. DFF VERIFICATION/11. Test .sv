class dff_test extends uvm_test;
  
  `uvm_component_utils(dff_test)
  
  dff_env env;
  dff_sequence seq;

  function new(string name = "test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = dff_env:: type_id::create("env",this);
    seq = dff_sequence::type_id::create("seq");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    #200;
    phase.drop_objection(this);
  endtask
   
endclass
   
