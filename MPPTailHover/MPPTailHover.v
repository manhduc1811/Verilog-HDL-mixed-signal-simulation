module MPPTailHover (clk,enableBeacon,enableDigitalLF,MPPsignal_out);
//declare input and output
    input clk;
    input enableBeacon;
	input enableDigitalLF;
    output signed [23:0] MPPsignal_out;
//declare the Beacon ROM - 40 registers each 8 bit wide.  
    reg signed [23:0] BeaconData [0:39];
	reg signed [23:0] DigitalLF [0:22];
//Internal signals  
    integer i;
	integer i_digLF;
    reg signed [23:0] MPPsignal_out; 
//Initialize the BeaconData rom with samples. 
    initial begin
        i = 0;
	BeaconData[0] =  1920;BeaconData[1] =  1920;BeaconData[2] =  1920;BeaconData[3] =  1920;
	BeaconData[4] =  1920;BeaconData[5] =  1920;BeaconData[6] =  1920;BeaconData[7] =  1920;
	BeaconData[8] =  1580;BeaconData[9] =   798;BeaconData[10] =   -3;BeaconData[11] = -804;
	BeaconData[12] =-1585;BeaconData[13] =-1920;BeaconData[14] =-1920;BeaconData[15] =-1920;
	BeaconData[16] =-1920;BeaconData[17] =-1920;BeaconData[18] =-1920;BeaconData[19] =-1920;
	BeaconData[20] =-1920;BeaconData[21] =-1920;BeaconData[22] =-1920;BeaconData[23] =-1920;
	BeaconData[24] =-1920;BeaconData[25] =-1920;BeaconData[26] =-1920;BeaconData[27] =-1920;
	BeaconData[28] =-1577;BeaconData[29] = -798;BeaconData[30] =    3;BeaconData[31] =  804;
	BeaconData[32] = 1585;BeaconData[33] = 1920;BeaconData[34] = 1920;BeaconData[35] = 1920;
	BeaconData[36] = 1920;BeaconData[37] = 1920;BeaconData[38] = 1920;BeaconData[39] = 1920;
    end
	
	initial begin
		i_digLF = 0;
	DigitalLF[0]  = 1920;
	DigitalLF[1]  = 1920;
	DigitalLF[2]  = 1920;
	DigitalLF[3]  = 1920;
	DigitalLF[4]  = 1100;
	DigitalLF[5]  = -300;
	DigitalLF[6]  = -1600;
	DigitalLF[7]  = -1920;
	DigitalLF[8]  = -1920;
	DigitalLF[9]  = -1920;
	DigitalLF[10] = -1920;
	DigitalLF[11] = -1920;
	DigitalLF[12] = -1920;
	DigitalLF[13] = -1920;
	DigitalLF[14] = -1920;
	DigitalLF[15] = -1600;
	DigitalLF[16] = -300;
	DigitalLF[17] = 1100;
	DigitalLF[18] = 1920;
	DigitalLF[19] = 1920;
	DigitalLF[20] = 1920;
	DigitalLF[21] = 1920;
	DigitalLF[22] = 1920;
	end
	
//At every positive edge of the clock, output a BeaconData wave sample.
    always@ (posedge(clk))
    begin
	if(enableBeacon)
	begin
		MPPsignal_out = BeaconData[i];
        i = i+ 1;
        if(i == 39)
           	i = 0;
	end
	else
		if (enableDigitalLF)
		begin
			MPPsignal_out = DigitalLF[i_digLF];
			i_digLF = i_digLF+1;
			if (i_digLF == 22)
				i_digLF = 0;
		end
		else
			MPPsignal_out = 0;
    end
endmodule
