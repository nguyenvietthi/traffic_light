module Traffic_Light(
    input        clk20M,
    input        Reset ,
    output [6:0] HEX0  ,
    output [6:0] HEX1  ,
    output [6:0] HEX2  ,
    output [6:0] HEX3  ,
    output       LR1   ,
    output       LR2   ,
    output       LG1   ,
    output       LG2   ,
    output       LY1   ,
    output       LY2   
    );
wire clk1,rst,timeout25,timeout30,eLED01,eLED23;
wire[4:0] Count;

Divide_freg F1(
    .clk20M(clk20M),
    .Reset(Reset),
    .clk1(clk1), 
    .rst(rst)
);
Downcounter F2(
    .clk1      (clk1     ),
    .rst       (rst      ),
    .timeout45 (timeout45),
    .timeout75 (timeout75),
    .timeout80 (timeout80),
    .Count     (Count    )
);
State F3(
    .clk1      (clk1     ),
    .rst       (rst      ),
    .timeout45 (timeout45),
    .timeout75 (timeout75),
    .timeout80 (timeout80),
    .LR1       (LR1      ),
    .LR2       (LR2      ),
    .LG1       (LG1      ),
    .LG2       (LG2      ),
    .LY1       (LY1      ),
    .LY2       (LY2      ),
    .eLED01    (eLED01   ),
    .eLED23    (eLED23   )
);
Led7seg F4(
    .LR1(LR1),
    .clk1(clk1),
    .eLED01(eLED01), 
    .eLED23(eLED23),
    .Count(Count),
    .hex0(HEX0),
    .hex1(HEX1),
    .hex2(HEX2),
    .hex3(HEX3)
);
endmodule
//thu vien Devide _freg, Downcounter, Led7seg, State, tb