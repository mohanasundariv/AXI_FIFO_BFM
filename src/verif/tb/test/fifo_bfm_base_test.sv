`ifndef FIFO_BFM_BASE_TEST_INCLUDED_
`define FIFO_BFM_BASE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: fifo_bfm_base_test
// Extends the uvm test 
//--------------------------------------------------------------------------------------------
class fifo_bfm_base_test extends uvm_test;
  `uvm_component_utils(fifo_bfm_base_test)

  //Instatiation of fifo_bfm_base_seq
  fifo_bfm_base_seq fifo_base_seq;
  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "fifo_bfm_base_test", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : fifo_bfm_base_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - fifo_bfm_base_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function fifo_bfm_base_test::new(string name = "fifo_bfm_base_test", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: run_phase
// Creates the fifo_bfm_base_seq sequence
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task fifo_bfm_base_test::run_phase(uvm_phase phase);

  fifo_base_seq=fifo_bfm_base_seq::type_id::create("fifo_base_seq");
  `uvm_info(get_type_name(),$sformatf("fifo_bfm_base_test"),UVM_LOW);
  phase.raise_objection(this);
  fifo_base_seq.start(axi_env_h.wr_fifo_sqr);
  phase.drop_objection(this);

endtask : run_phase

`endif





