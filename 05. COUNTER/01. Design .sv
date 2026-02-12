// Synchronous Up Counter
module counter (
  input  logic clk,
  input  logic reset,
  input  logic enable,
  output logic [3:0] count
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b0000;
    else if (enable)
      count <= count + 1'b1;
    else
      count <= count;
  end

endmodule
  
