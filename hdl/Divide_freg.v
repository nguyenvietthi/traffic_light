`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2021 05:41:52 PM
// Design Name: 
// Module Name: Divide_freg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Divide_freg(
    input clk30M,
    input Reset,
    output reg clk1,
    output reg rst
    );
localparam divide_count = 30000000;
reg [31:0]count;

always@(posedge clk30M , posedge Reset)
begin
	if(Reset)
		begin
		clk1 <= 1'b0;
		count <= 32'b0;
	
		end
	else if(count == divide_count - 1)
		begin
		clk1 <= ~ clk1;
		count <= 32'b0;
	
		end
	else
	   begin
	   clk1 <= clk1;
	   count <= count + 1 ;
	 
	   end
end
always@(*)
begin
	if(Reset)
		begin
        rst = 1;
		end
	else
	    begin
        rst = 0;
	    end
end

endmodule