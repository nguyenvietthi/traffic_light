module Led7seg(
    input LR1,
    input clk1,
    input eLED01,
    input eLED23,
    input [6:0] Count,
    output reg [6:0] hex0,
    output reg [6:0] hex1,
    output reg [6:0] hex2,
    output reg [6:0] hex3
    );
reg [4:0] countled;
reg [3:0] countled1;
reg [3:0] countled2;
always@(posedge clk1) 
begin
    countled  = Count%25;
    countled1 = countled/10;
    countled2 = countled%10;
end
// gia su led 0 sang
always @(*)
  begin
  if(eLED01) begin
    case(countled2)
      0       :  hex0 <= 7'b0000001;
      1       :  hex0 <= 7'b1001111;
      2       :  hex0 <= 7'b0010010;
      3       :  hex0 <= 7'b0000110;
      4       :  hex0 <= 7'b1001100;
      5       :  hex0 <= 7'b0100100;
      6       :  hex0 <= 7'b0100000;
      7       :  hex0 <= 7'b0001111;
      8       :  hex0 <= 7'b0000000;
      default :  hex0 <= 7'b0000100;
    endcase
    case(countled1)
      0       :  hex1 <= 7'b0000001;
      1       :  hex1 <= 7'b1001111;
      2       :  hex1 <= 7'b0010010;
      3       :  hex1 <= 7'b0000110;
      4       :  hex1 <= 7'b1001100;
      5       :  hex1 <= 7'b0100100;
      6       :  hex1 <= 7'b0100000;
      7       :  hex1 <= 7'b0001111;
      8       :  hex1 <= 7'b0000000;
      default :  hex1 <= 7'b0000100;
    endcase
  end
  end
  always @(*)
  begin
  if(eLED23) begin
    case(countled2)
      0       :  hex2 <= 7'b0000001;
      1       :  hex2 <= 7'b1001111;
      2       :  hex2 <= 7'b0010010;
      3       :  hex2 <= 7'b0000110;
      4       :  hex2 <= 7'b1001100;
      5       :  hex2 <= 7'b0100100;
      6       :  hex2 <= 7'b0100000;
      7       :  hex2 <= 7'b0001111;
      8       :  hex2 <= 7'b0000000;
      default :  hex2 <= 7'b0000100;
    endcase
    case(countled1)
      0       :  hex3 <= 7'b0000001;
      1       :  hex3 <= 7'b1001111;
      2       :  hex3 <= 7'b0010010;
      3       :  hex3 <= 7'b0000110;
      4       :  hex3 <= 7'b1001100;
      5       :  hex3 <= 7'b0100100;
      6       :  hex3 <= 7'b0100000;
      7       :  hex3 <= 7'b0001111;
      8       :  hex3 <= 7'b0000000;
      default :  hex3 <= 7'b0000100;
    endcase
  end
  end
endmodule
