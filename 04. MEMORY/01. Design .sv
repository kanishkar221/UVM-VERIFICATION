// Single Port Synchronous RAM (16 x 8)

module ram (
  input logic  clk,         // clk signal
  input logic  wr,          // write enable (1=write, 0=read)
  input logic  [7:0] d_in,  // 8 bit input data (data to write)
  input logic  [3:0] addr,  // 4 bit address (selects 1 to 16 locations)
  output logic [7:0] d_out  // 8 bit data output (data read)
);
  
  // 16 locations (0 to 15). Each loaction store 8 bits
  logic [7:0] mem [15:0];
  
  always @ (posedge clk) begin   // Synchronous RAM
    
    if(wr)
      // write operation
      // when wr = 1, store d_in into memory at address 'addr'
      mem[addr] <= d_in;   
    
    else
      // read operation
      // when wr = 0, read memory at 'addr'. Output appears after clock edge (synchronous read)
      d_out <= mem[addr];  
  end
  
endmodule
