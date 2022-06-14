module State(
    input      clk1     ,
    input      rst      ,
    input      timeout45,
    input      timeout75,
    input      timeout80,
    output reg LR1      ,
    output reg LR2      ,
    output reg LG1      ,
    output reg LG2      ,
    output reg LY1      ,
    output reg LY2      ,
    output reg eLED01   ,
    output reg eLED23   
    );
localparam [1:0] 
    GO   = 2'b00,
    STOP = 2'b01,
    WAIT = 2'b10;
reg[1:0] state_reg, state_next;

always@(posedge clk1, posedge rst)
begin
    if(rst)
        begin
        state_reg <= STOP;
        end
    else
        begin
        state_reg <= state_next;
        end
end

always@(*)
begin
    state_next = state_reg;
    LR1=0;LR2=0;LG1=0;LG2=0;LY1=0;LY2=0;    
    case(state_reg)
        STOP: begin
            LR1=1;LR2=0;LG1=0;LG2=1;LY1=0;LY2=0;
            if(timeout45) begin
                state_next = GO;
                end
            else begin
                state_next = STOP;
                end
        end
        GO: begin
            LR1=0;LR2=1;LG1=1;LG2=0;LY1=0;LY2=0;
            if(timeout75) begin
                state_next = WAIT;
            end
            else begin
                state_next = GO;
            end
        end
        WAIT: begin
            LR1=0;LR2=0;LG1=0;LG2=0;LY1=1;LY2=1;
            if(timeout80) begin
                state_next = STOP;
            end
            else begin
                state_next = WAIT;
            end
        end
    endcase
end
always@(*)begin
    if(rst) begin
        eLED01 = 1'b0;
        eLED23 = 1'b0;
        end
    else begin
        eLED01 = 1'b1;
        eLED23 = 1'b1;
    end

end

endmodule