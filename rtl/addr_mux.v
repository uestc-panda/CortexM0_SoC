module addr_mux(
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
            addr_start = 8'd30;
            addr_finish = 8'd59;
        end
        2'b10: begin
            addr_start = 8'd60;
            addr_finish = 8'd89;
        end
        2'b11: begin
            addr_start = 8'd90;
            addr_finish = 8'd119;
        end       
        default: begin
            addr_start = 8'd0;
            addr_finish = 8'd0;
        end  
    endcase
end

endmodule