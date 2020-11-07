module sine_wave_gen_tb;
    // Inputs
    reg Clk;
    // Outputs
    wire [7:0] data_out;
    // Unit Under Test (UUT)
    sine_wave_gen uut (
        .Clk(Clk), 
        .data_out(data_out));
    // clocks
    initial begin
		Clk = 1;
		forever #20833 Clk = ~Clk;
	end	
    initial begin
		//$shm_open("./sine_wave_gen.shm");
		//$shm_probe(tb_sine_wave_gen,"AS");
		#10000000;
		$stop;
	end
endmodule
