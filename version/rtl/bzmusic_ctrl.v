module bzmusic_ctrl(
    input   clk,
    input   en,
    input   rstn,
    input   music_finish,
    input   beat_finish,
    output  reg addr_en,
    output  reg addr_rstn,
    output  reg tune_pwm_en,
    output  reg tune_pwm_rstn,
    output  reg beat_cnt_en,
    output  reg beat_cnt_rstn
);

parameter IDLE  = 2'b00;
parameter ADD   = 2'b01;
parameter EX    = 2'b10;

reg  [3:0]  state;
reg  [3:0]  state_nxt;

always @(en or beat_finish or music_finish or state) begin
    case (state)
        IDLE :begin
            if (en) begin
                state_nxt = ADD;
            end else begin
                state_nxt = IDLE;
            end
        end
        ADD  :begin
            if (music_finish) begin
                state_nxt = IDLE;
            end else begin
                state_nxt = EX;
            end
        end
        EX   :begin
            if (beat_finish) begin
                state_nxt = ADD;
            end else begin
                state_nxt = EX;
            end
        end
        default: state_nxt = IDLE;
    endcase
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        state <= IDLE;
    end else begin
        state <= state_nxt;
    end
end

always @(posedge clk) begin
    case (state_nxt)
        IDLE:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b0;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end  
        ADD:begin
            addr_en <= 1'b1;
            addr_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end       
        EX:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_pwm_en <= 1'b1;
            tune_pwm_rstn <= 1'b1;
            beat_cnt_en <= 1'b1;
            beat_cnt_rstn <= 1'b1;
        end 
        default:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b0;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end
    endcase
end

endmodule