module bzmusic_ctrl(
    input   clk,
    input   en,
    input   rstn,
    input   tune_or_beat,
    input   music_finish,
    input   beat_finish,
    output  reg addr_select_en,
    output  reg addr_select_rstn,
    output  reg addr_en,
    output  reg addr_rstn,
    output  reg tune_en,
    output  reg tune_rstn,
    output  reg beat_en,
    output  reg beat_rstn,
    output  reg tune_pwm_en,
    output  reg tune_pwm_rstn,
    output  reg beat_cnt_en,
    output  reg beat_cnt_rstn
);

parameter IDLE  = 4'b0000;
parameter ADD   = 4'b0001;
parameter DF1   = 4'b0010;//delay
parameter DF2   = 4'b0011;//delay
parameter JUDGE = 4'b0100;
parameter ID_t  = 4'b0101;//wait read tune 
parameter ID_b  = 4'b0110;//wait read beat
parameter DELAY = 4'b0111;
parameter EX    = 4'b1000;

reg  [3:0]  state;
reg  [3:0]  state_nxt;

always @(en or tune_or_beat or beat_finish or music_finish or state) begin
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
                state_nxt = DF1;
            end
        end
        DF1  :state_nxt = DF2;
        DF2  :state_nxt = JUDGE;
        JUDGE:begin
            if (tune_or_beat) begin
                state_nxt = ID_t;
            end else begin
                state_nxt = ID_b;
            end
        end
        ID_t :state_nxt = ADD;
        ID_b :state_nxt = DELAY;
        DELAY:state_nxt = EX;
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
    case (state)
        IDLE:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b0;
            tune_en <= 1'b0;
            tune_rstn <= 1'b0;
            beat_en <= 1'b0;
            beat_rstn <= 1'b0;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end  
        ADD:begin
            addr_en <= 1'b1;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end       
        DF1:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end  
        DF2:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end
        JUDGE:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;           
        end
        ID_t:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b1;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end
        ID_b:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b1;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end
        DELAY:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end      
        EX:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b1;
            tune_en <= 1'b0;
            tune_rstn <= 1'b1;
            beat_en <= 1'b0;
            beat_rstn <= 1'b1;
            tune_pwm_en <= 1'b1;
            tune_pwm_rstn <= 1'b1;
            beat_cnt_en <= 1'b1;
            beat_cnt_rstn <= 1'b1;
        end 
        default:begin
            addr_en <= 1'b0;
            addr_rstn <= 1'b0;
            tune_en <= 1'b0;
            tune_rstn <= 1'b0;
            beat_en <= 1'b0;
            beat_rstn <= 1'b0;
            tune_pwm_en <= 1'b0;
            tune_pwm_rstn <= 1'b0;
            beat_cnt_en <= 1'b0;
            beat_cnt_rstn <= 1'b0;
        end
    endcase
end

endmodule