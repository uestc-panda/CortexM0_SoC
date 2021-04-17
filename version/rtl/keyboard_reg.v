module keyboard_reg (
    input                rstn,
    input                key_clear,//高有效
    input        [15:0]  key_pulse,
    output  reg  [15:0]  key_reg
);

wire clear;
assign clear = rstn && (!key_clear) ;

always @(posedge key_pulse[15], negedge clear ) begin
    if ( !clear) begin
        key_reg[15] <= 1'b0;
    end else begin
        key_reg[15] <= 1'b1;
    end
end

always @(posedge key_pulse[14], negedge clear ) begin
    if (!clear) begin
        key_reg[14] <= 1'b0;
    end else begin
        key_reg[14] <= 1'b1;
    end
end

always @(posedge key_pulse[13], negedge clear ) begin
    if (!clear) begin
        key_reg[13] <= 1'b0;
    end else begin
        key_reg[13] <= 1'b1;
    end
end

always @(posedge key_pulse[12], negedge clear ) begin
    if (!clear) begin
        key_reg[12] <= 1'b0;
    end else begin
        key_reg[12] <= 1'b1;
    end
end

always @(posedge key_pulse[11], negedge clear ) begin
    if (!clear) begin
        key_reg[11] <= 1'b0;
    end else begin
        key_reg[11] <= 1'b1;
    end
end

always @(posedge key_pulse[10], negedge clear ) begin
    if (!clear) begin
        key_reg[10] <= 1'b0;
    end else begin
        key_reg[10] <= 1'b1;
    end
end

always @(posedge key_pulse[9], negedge clear ) begin
    if (!clear) begin
        key_reg[9] <= 1'b0;
    end else begin
        key_reg[9] <= 1'b1;
    end
end

always @(posedge key_pulse[8], negedge clear ) begin
    if (!clear) begin
        key_reg[8] <= 1'b0;
    end else begin
        key_reg[8] <= 1'b1;
    end
end

always @(posedge key_pulse[7], negedge clear ) begin
    if (!clear) begin
        key_reg[7] <= 1'b0;
    end else begin
        key_reg[7] <= 1'b1;
    end
end

always @(posedge key_pulse[6], negedge clear ) begin
    if (!clear) begin
        key_reg[6] <= 1'b0;
    end else begin
        key_reg[6] <= 1'b1;
    end
end

always @(posedge key_pulse[5], negedge clear ) begin
    if (!clear) begin
        key_reg[5] <= 1'b0;
    end else begin
        key_reg[5] <= 1'b1;
    end
end

always @(posedge key_pulse[4], negedge clear ) begin
    if (!clear) begin
        key_reg[4] <= 1'b0;
    end else begin
        key_reg[4] <= 1'b1;
    end
end

always @(posedge key_pulse[3], negedge clear ) begin
    if (!clear) begin
        key_reg[3] <= 1'b0;
    end else begin
        key_reg[3] <= 1'b1;
    end
end

always @(posedge key_pulse[2], negedge clear ) begin
    if (!clear) begin
        key_reg[2] <= 1'b0;
    end else begin
        key_reg[2] <= 1'b1;
    end
end

always @(posedge key_pulse[1], negedge clear ) begin
    if (!clear) begin
        key_reg[1] <= 1'b0;
    end else begin
        key_reg[1] <= 1'b1;
    end
end

always @(posedge key_pulse[0], negedge clear ) begin
    if (!clear) begin
        key_reg[0] <= 1'b0;
    end else begin
        key_reg[0] <= 1'b1;
    end
end

endmodule



