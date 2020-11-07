module tb_MPPTailErase;
    // Inputs
    reg clk;
    reg enableBeacon;
	reg enableDigitalLF;
	reg enablePressure;
    // Outputs
    wire [23:0] MPPsignal_out;
    // Instantiate the Unit Under Test (UUT)
    MPPTailErase uut (
	.clk(clk), 
	.enableBeacon(enableBeacon),
	.enableDigitalLF(enableDigitalLF),	
	.enablePressure(enablePressure),
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
		enablePressure = 0;
		#7506000;
		enablePressure = 1;
		#1281000;
		enablePressure = 0;
	end
    initial begin
		//$shm_open("./MPPTailErase.shm");
		//$shm_probe(tb_MPPTailErase,"AS");
		#15300000;
		$finish;
	end
endmodule