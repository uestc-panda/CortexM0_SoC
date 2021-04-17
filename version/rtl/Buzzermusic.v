module Buzzermusic(
    input           clk,
    input           rstn,
    input    [1:0]  music_select,
    input           music_start,
    output          music_finish,
    output          beep
);
//start and select change in the same time

wire en;
assign en = music_start;

//---------------------------------------------------
//Addr_parameter
//---------------------------------------------------

wire [7:0] addr_start;
wire [7:0] addr_finish;
addr_mux addr_mux(
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

//---------------------------------------------------
//Music_Ctrl
//---------------------------------------------------

wire beat_finish;
wire addr_en;
wire addr_rstn;
wire tune_pwm_en;
wire tune_pwm_rstn;
wire beat_cnt_en;
wire beat_cnt_rstn;
bzmusic_ctrl bzmusic_ctrl(
    .clk                     (clk)
    ,.en                     (en)
    ,.rstn                   (rstn)
    ,.music_finish           (music_finish)
    ,.beat_finish            (beat_finish)
    ,.addr_en                (addr_en)
    ,.addr_rstn              (addr_rstn)
    ,.tune_pwm_en            (tune_pwm_en)
    ,.tune_pwm_rstn          (tune_pwm_rstn)
    ,.beat_cnt_en            (beat_cnt_en)
    ,.beat_cnt_rstn          (beat_cnt_rstn) 
);

//---------------------------------------------------
//Addr_cnt
//---------------------------------------------------
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

//---------------------------------------------------
//Block_ROM: music_data
//---------------------------------------------------

wire [11:0] data;
BlockROM #(
     .ADDR_WIDTH(8)
    ,.DATA_WIDTH(12)
) BlockROM (
     .clk(clk)
    ,.addr_i(addr)
    ,.data_o(data)
);

//---------------------------------------------------
//Tune PWM
//---------------------------------------------------

wire [19:0] tune_pwm_parameter;
tune_decoder tune_decoder(
     .tune                (data[11:4])
    ,.tune_pwm_parameter  (tune_pwm_parameter)
);

tune_pwm tune_pwm(     
     .clk            (clk)
    ,.en             (tune_pwm_en)
    ,.rst_n          (tune_pwm_rstn)
    ,.pwm_parameter  (tune_pwm_parameter)
    ,.clk_pwm        (beep)
);

//---------------------------------------------------
//Beat CNT
//---------------------------------------------------

wire  [27:0]  beat_cnt_parameter;
beat_decoder beat_decoder(
     .beat                (data[3:0])
    ,.beat_cnt_parameter  (beat_cnt_parameter)
);

beat_cnt beat_cnt(
     .clk                 (clk)
    ,.en                  (beat_cnt_en)
    ,.rstn                (beat_cnt_rstn)
    ,.beat_cnt_parameter  (beat_cnt_parameter)
    ,.beat_finish         (beat_finish)
);

endmodule