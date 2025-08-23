module config_register (
    input logic clk, rst,
    //Baud Rate Options are 9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600, 1843200
    input logic[3:0] baud_rate,
    input logic[1:0] data_size,
    input logic parity_bit,
    input logic stop_bits
    input logic load_register,
    output logic config_register_ready,
    output logic[3:0] baud_rate_out,
    output logic[1:0] data_size_out,
    output logic parity_bit_out,
    output logic stop_bits_out
);

always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
        baud_rate_out <= '0;
        data_size_out <= '0;
        parity_bit_out <= '0;
        stop_bits_out <= '0;
        config_register_ready <= '0;
    end
    else if(load_register) begin
        baud_rate_out <= baud_rate;
        data_size_out <= data_size;
        parity_bit_out <= parity_bit;
        stop_bits_out <= stop_bits;
        config_register_ready <= 1'b1;
    end
end
endmodule