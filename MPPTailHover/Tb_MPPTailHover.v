module tb_MPPTailHover;
    // Inputs
    reg clk;
    reg enableBeacon;
	reg enableDigitalLF;
    // Outputs
    wire [23:0] MPPsignal_out;
    // Instantiate the Unit Under Test (UUT)
    MPPTailHover uut (
	.clk(clk), 
	.enableBeacon(enableBeacon),
	.enableDigitalLF(enableDigitalLF),	
    .MPPsignal_out(MPPsignal_out)
    );
    initial begin
		clk = 1;
		forever #500 clk = ~clk;
	end
    initial begin
		enableBeacon = 1;
		#1282000;
		enableBeacon = 0;
	end		
	initial begin
	    enableDigitalLF = 0;
		#1342000;
		enableDigitalLF = 1;
		#1038000;
		enableDigitalLF = 0;
	end
    initial begin
		//$shm_open("./MPPTailHover.shm");
		//$shm_probe(tb_MPPTailHover,"AS");
		#15300000;
		$finish;
	end
endmodule
