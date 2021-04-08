module beat_decoder(
    input        [3 :0]  beat,
    output  reg  [27:0]  beat_cnt_parameter
);

localparam beat_cnt_parameter_1  = 28'h4C4B400;//1  1600ms
localparam beat_cnt_parameter_2  = 28'h2625A00;//2  800ms
localparam beat_cnt_parameter_4  = 28'h1312D00;//4  400ms
localparam beat_cnt_parameter_8  = 28'h0989680;//8  200ms
localparam beat_cnt_parameter_16 = 28'h04C4B40;//16 100ms
localparam beat_cnt_parameter_32 = 28'h02625A0;//32 50ms
localparam beat_cnt_parameter_64 = 28'h01312D0;//64 25ms


always @(beat) begin
    case(beat)
    4'h0: beat_cnt_parameter = beat_cnt_parameter_1;
    4'h1: beat_cnt_parameter = beat_cnt_parameter_2;
    4'h2: beat_cnt_parameter = beat_cnt_parameter_4;
    4'h3: beat_cnt_parameter = beat_cnt_parameter_8;
    4'h4: beat_cnt_parameter = beat_cnt_parameter_16;
    4'h5: beat_cnt_parameter = beat_cnt_parameter_32;
    4'h6: beat_cnt_parameter = beat_cnt_parameter_64;
    default: beat_cnt_parameter = 28'h0;
    endcase
end

endmodule