module tb_MPPRingHover;
    // Inputs
    reg clk;
    reg enablePortTypeHF;
    // Outputs
    wire [23:0] MPPsignal_out;
    // Instantiate the Unit Under Test (UUT)
    MPPRingHover uut (
	.clk(clk), 
	.enablePortTypeHF(enablePortTypeHF),
    .MPPsignal_out(MPPsignal_out)
    );
    initial begin
		clk = 1;
		forever #500 clk = ~clk;
	end
    initial begin
		enablePortTypeHF = 0;
		#3539000;
		enablePortTypeHF = 1;
		#470000;
		enablePortTypeHF = 0;
	end	
    initial begin
		//$shm_open("./MPPRingHover.shm");
		//$shm_probe(tb_MPPRingHover,"AS");
		#15300000;
		$finish;
	end	
endmodule
