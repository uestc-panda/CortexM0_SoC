module Buzzermusic(
    input           clk,
    input           rstn,
    input    [1:0]  music_select,//start and select change in the same time
    input           music_start,
    output          music_finish,
    output          beep
);

wire en;
assign en = music_start;

wire [7:0] addr_start;
wire [7:0] addr_finish;
addr_decoder addr_decoder(
    .select(music_select)
    ,.addr_start(addr_start)
    ,.addr_finish(addr_finish)
);

wire [7:0] addr_start_reg;
register # (
    .WIDTH(8)
) addr_parameter1_register (
     .clk(clk)
    ,.en(en)
    ,.rstn(rstn)
    ,.data_in(addr_start)
    ,.data_out(addr_start_reg)
);

wire [7:0] addr_finish_reg;
register # (
    .WIDTH(8)
) addr_parameter2_register (
     .clk(clk)
    ,.en(en)
    ,.rstn(rstn)
    ,.data_in(addr_finish)
    ,.data_out(addr_finish_reg)
);

wire beat_finish;
wire addr_en;
wire addr_rstn;
wire tune_or_beat;
wire tune_en;
wire tune_rstn;
wire beat_en;
wire beat_rstn;
wire tune_pwm_en;
wire tune_pwm_rstn;
wire beat_cnt_en;
wire beat_cnt_rstn;
bzmusic_ctrl bzmusic_ctrl(
    .clk                (clk)
    ,.en                (en)
    ,.rstn              (rstn)
    ,.tune_or_beat      (tune_or_beat)
    ,.music_finish      (music_finish)
    ,.beat_finish       (beat_finish)
    ,.addr_select_en    (addr_select_en)
    ,.addr_select_rstn  (addr_select_rstn)
    ,.addr_en           (addr_en)
    ,.addr_rstn         (addr_rstn)
    ,.tune_en           (tune_en)
    ,.tune_rstn         (tune_rstn)
    ,.beat_en           (beat_en)
    ,.beat_rstn         (beat_rstn)
    ,.tune_pwm_en       (tune_pwm_en)
    ,.tune_pwm_rstn     (tune_pwm_rstn)
    ,.beat_cnt_en       (beat_cnt_en)
    ,.beat_cnt_rstn     (beat_cnt_rstn) 
);

wire [7:0] addr;
addr_cnt addr_cnt(
     .clk           (clk)
    ,.en            (addr_en)
    ,.rstn          (addr_rstn)
    ,.addr_start    (addr_start_reg)
    ,.addr_finish   (addr_finish_reg)
    ,.addr          (addr)
    ,.music_finish  (music_finish)
);

BlockROM1 #(
     .ADDR_WIDTH(8)
    ,.DATA_WIDTH(1)
) BlockROM1 (
     .clk(clk)
    ,.addr_i(addr)
    ,.data_o(tune_or_beat)
);

wire [7:0] data;
BlockROM8 #(
     .ADDR_WIDTH(8)
    ,.DATA_WIDTH(8)
) BlockROM8 (
     .clk(clk)
    ,.addr_i(addr)
    ,.data_o(data)
);

wire [19:0] tune_pwm_parameter;
tune_decoder tune_decoder(
     .tune                (data)
    ,.tune_pwm_parameter  (tune_pwm_parameter)
);

wire [19:0] tune_pwm_parameter_reg;
register #(
    .WIDTH(20)
) tune_parameter_register(
     .clk(clk)
    ,.en(tune_en)
    ,.rstn(tune_rstn)
    ,.data_in(tune_pwm_parameter)
    ,.data_out(tune_pwm_parameter_reg)
);

tune_pwm tune_pwm(     
     .clk            (clk)
    ,.en             (tune_pwm_en)
    ,.rst_n          (tune_pwm_rstn)
    ,.pwm_parameter  (tune_pwm_parameter_reg)
    ,.clk_pwm        (beep)
);

wire [3:0] beat;
assign beat = {data[3:0]};
wire  [27:0]  beat_cnt_parameter;
beat_decoder beat_decoder(
     .beat                (beat)
    ,.beat_cnt_parameter  (beat_cnt_parameter)
);

wire [27:0] beat_cnt_parameter_reg;
register #(
    .WIDTH(28)
) beat_parameter_register(
     .clk(clk)
    ,.en(beat_en)
    ,.rstn(beat_rstn)
    ,.data_in(beat_cnt_parameter)
    ,.data_out(beat_cnt_parameter_reg)
);

beat_cnt beat_cnt(
     .clk                 (clk)
    ,.en                  (beat_cnt_en)
    ,.rstn                (beat_cnt_rstn)
    ,.beat_cnt_parameter  (beat_cnt_parameter_reg)
    ,.beat_finish         (beat_finish)   
);

endmodule