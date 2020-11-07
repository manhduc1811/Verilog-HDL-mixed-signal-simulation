module tb_MPP20Beacon;
    // Inputs
    reg Clk;
    reg enable;	
    // Outputs
    wire [23:0] BeaconData_out;
    // Instantiate the Unit Under Test (UUT)
    MPP20Beacon uut (
        .Clk(Clk), 
	.enable(enable),
        .BeaconData_out(BeaconData_out)
    );
    initial begin
		Clk = 1;
		forever #500 Clk = ~Clk;
	end
    initial begin
		enable = 1;
		#1282000;
		enable = 0;
	end		
    initial begin
		//$shm_open("./MPP20Beaconv0.shm");
		//$shm_probe(tb_MPP20Beaconv0,"AS");
		#15300000;
		$finish;
	end
endmodule