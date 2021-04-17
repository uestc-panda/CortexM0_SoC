module addr_mux(
    input        [1:0]  select,
    output  reg  [7:0]  addr_start,
    output  reg  [7:0]  addr_finish
);

always @(select) begin
    case (select)
        2'b00: begin
            addr_start = 8'd1;
            addr_finish = 8'd15;
        end
        2'b01: begin
            addr_start = 8'd16;
            addr_finish = 8'd30;
        end
        2'b10: begin
            addr_start = 8'd31;
            addr_finish = 8'd45;
        end
        2'b11: begin
            addr_start = 8'd46;
            addr_finish = 8'd60;
        end       
        default: begin
            addr_start = 8'd0;
            addr_finish = 8'd0;
        end  
    endcase
end

endmodule