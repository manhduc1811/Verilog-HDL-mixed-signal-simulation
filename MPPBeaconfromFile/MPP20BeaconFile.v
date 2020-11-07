module MPP20Beacon (Clk,enable,BeaconData_out); 
//declare input and output
    input Clk;
    input enable;
    output signed [23:0] BeaconData_out;
//ROM - 40 registers, each 24 bit wide
    reg[23:0] BeaconData [0:39];
//Internal signals  
    integer i;
    reg signed [23:0] BeaconData_out; 
//Initialize the BeaconData ROM with samples
    initial begin 
	i = 0;
        $readmemb("x_Beacon.txt", BeaconData);
    end
//At every positive edge of the clock, output a BeaconData wave sample.
    always@ (posedge(Clk))
    begin
	if(enable)
	begin
		BeaconData_out = BeaconData[i];
        	i = i+ 1;
        	if(i == 39)
            	i = 0;
	end
	else
		BeaconData_out = 0;
    end
endmodule
