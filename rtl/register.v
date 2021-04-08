module register #(
    parameter WIDTH = 4
) (
    input                     clk,
    input                     en,
    input                     rstn,
    input        [WIDTH-1:0]  data_in,
    output  reg  [WIDTH-1:0]  data_out
);

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        data_out <= 4'd0;
    end else begin
        if (en) begin
            data_out <= data_in;
        end else begin
            data_out <= data_out;
        end
    end
end

endmodule