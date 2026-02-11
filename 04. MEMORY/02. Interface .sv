interface ram_if;
  logic clk;
  logic wr;
  logic [7:0] d_in;
  logic [3:0] addr;
  logic [7:0] d_out;
endinterface
