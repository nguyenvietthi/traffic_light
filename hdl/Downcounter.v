module Downcounter(
    input            clk1     ,
    input            rst      ,
    output  reg      timeout45,
    output  reg      timeout75,
    output  reg      timeout80,
    output reg [6:0] Count    
    );
localparam count_timeout45 = 45 ;
localparam count_timeout75 = 75 ;
localparam count_timeout80 = 80;

always@(posedge clk1, posedge rst)
begin
    if(rst)
        begin
        Count <= 5'b0;
        end
    else if (Count == count_timeout80 - 1)
        begin
        Count <= 5'b0;
        end
    else
        begin
        Count <= Count + 1;
        end
end

always@(*)
begin
     if (Count == count_timeout45 - 1)
        begin
        timeout45 = 1;
        end
    else
        begin
         timeout45 = 0;
        end
end
always@(*)
begin
     if (Count == count_timeout75 - 1)
        begin
        timeout75 = 1;
        end
    else
        begin
         timeout75 = 0;
        end
end

always@(*)
begin
     if (Count == count_timeout80 - 1)
        begin
        timeout80 = 1;
        end
    else
        begin
         timeout80 = 0;
        end
end
endmodule
