`timescale 1ns/1ps
module tb ();
  logic       clk20M;
  logic       Reset ;
  logic [6:0] HEX0  ;
  logic [6:0] HEX1  ;
  logic [6:0] HEX2  ;
  logic [6:0] HEX3  ;
  logic       LR1   ;
  logic       LR2   ;
  logic       LG1   ;
  logic       LG2   ;
  logic       LY1   ;
  logic       LY2   ;

  always #10 clk20M = ~clk20M;

  initial begin 
    clk20M = 0;
    Reset  = 0;
    @(negedge clk20M);
    Reset = 1;
    @(negedge clk20M);
    Reset = 0;
    repeat(100000000) @(negedge clk20M);  
    $finish;
  end

  Traffic_Light DUT (
    .clk20M (clk20M),
    .Reset  (Reset ),
    .HEX0   (HEX0  ),
    .HEX1   (HEX1  ),
    .HEX2   (HEX2  ),
    .HEX3   (HEX3  ),
    .LR1    (LR1   ),
    .LR2    (LR2   ),
    .LG1    (LG1   ),
    .LG2    (LG2   ),
    .LY1    (LY1   ),
    .LY2    (LY2   )
  );
endmodule