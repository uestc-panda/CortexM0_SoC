module BlockROM_signal # (
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 1,
    parameter sel = 0
)(
    input                               clk,
    input        [ADDR_WIDTH-1 : 0]     addr_i,
    output  reg  [DATA_WIDTH-1 : 0]     data_o
);

(* ramstyle = "AUTO" *) reg [DATA_WIDTH-1 : 0] mem[(2**ADDR_WIDTH-1) : 0];

initial begin
    if (sel == 0) $readmemh("C:/Users/73474/Desktop/M0/Music/rtl/signal0.txt", mem);
    if (sel == 1) $readmemh("C:/Users/73474/Desktop/M0/Music/rtl/signal1.txt", mem);
    if (sel == 2) $readmemh("C:/Users/73474/Desktop/M0/Music/rtl/signal2.txt", mem);
    if (sel == 3) $readmemh("C:/Users/73474/Desktop/M0/Music/rtl/signal3.txt", mem);
end

always @ (posedge clk) begin
    data_o <= mem[addr_i];
end

endmodule