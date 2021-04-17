module addr_cnt (
    input          clk,
    input          en,
    input          rstn,
    input   [7:0]  addr_start,
    input   [7:0]  addr_finish,
    output  [7:0]  addr,
    output         music_finish
);

wire [7:0] addr_nxt = ((addr >= addr_finish) || (addr < addr_start)) ? addr_start : addr + 1'b1 ;

register # (
    .WIDTH(8)
) addr_register (
     .clk(clk)
    ,.en(en)
    ,.rstn(rstn)
    ,.data_in(addr_nxt)
    ,.data_out(addr)
);

assign  music_finish = (addr == addr_finish) ? 1'b1 : 1'b0;


endmodule