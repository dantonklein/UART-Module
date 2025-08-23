module baud_rate_generator #(
    parameter int clock_frequency = 100000000,
    parameter int oversampling = 16
) (
    input logic clk, rst,
    input logic[3:0] baud_rate_select,
    input logic update_baud_rate,
    output logic baud_tick, sample_tick 
);
localparam int max_count = clock_frequency / (9600 * oversampling);
logic [$clog2(max_count)-1:0] count;
logic [$clog2(oversampling)-1:0] oversample_count;
logic [$clog2(max_count)-1:0] baudrate_max_count;

localparam logic[$clog2(max_count)-1:0] BR_9600 = clock_frequency / (9600 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_19200 = clock_frequency / (19200 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_38400 = clock_frequency / (38400 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_57600 = clock_frequency / (57600 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_115200 = clock_frequency / (115200 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_230400 = clock_frequency / (230400 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_460800 = clock_frequency / (460800 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_921600 = clock_frequency / (921600 * oversampling);
localparam logic[$clog2(max_count)-1:0] BR_1843200 = clock_frequency / (1843200 * oversampling);


always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
        baud_tick <= 0;
        sample_tick <= 0;
        count <= '0;
        oversample_count <= '0;
        baudrate_max_count <= BR_9600;
    end
    else if(update_baud_rate) begin
        case(baud_rate_select)
            4'd0: baudrate_max_count <= BR_9600;
            
        endcase
    end
end

endmodule