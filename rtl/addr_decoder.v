module addr_decoder(
    input        [1:0]  select,
    output  reg  [7:0]  addr_start,
    output  reg  [7:0]  addr_finish
);

always @(select) begin
    case (select)
        2'b00: begin
            addr_start = 8'd0;
            addr_finish = 8'd29;
        end
        2'b01: begin
            addr_start = 8'd40;
            addr_finish = 8'd73;
        end
        2'b10: begin
            addr_start = 8'd80;
            addr_finish = 8'd119;
        end
        2'b11: begin
            addr_start = 8'd120;
            addr_finish = 8'd159;
        end       
        default: begin
            addr_start = 8'd0;
            addr_finish = 8'd0;
        end  
    endcase
end

endmodule