module MPPTailErase (clk,enableBeacon,enableDigitalLF,enablePressure,MPPsignal_out);
//declare input and output
    input clk;
    input enableBeacon;
	input enableDigitalLF;
	input enablePressure;
    output signed [23:0] MPPsignal_out;
//declare the Beacon ROM - 40 registers each 8 bit wide.  
    reg signed [23:0] BeaconData [0:39];
	reg signed [23:0] DigitalLF [0:22];
	reg signed [23:0] Pressure [0:51];
//Internal signals  
    integer i;
	integer i_digLF;
	integer i_press;
    reg signed [23:0] MPPsignal_out; 
//Initialize the BeaconData rom with samples. 
    initial begin
        i = 0;
	BeaconData[0] =  1920;
	BeaconData[1] =  1920;
	BeaconData[2] =  1920;
	BeaconData[3] =  1920;
	BeaconData[4] =  1920;
	BeaconData[5] =  1920;
	BeaconData[6] =  1920;
	BeaconData[7] =  1920;
	BeaconData[8] =  1580;
	BeaconData[9] =   798;
	BeaconData[10] =   -3;
	BeaconData[11] = -804;
	BeaconData[12] =-1585;
	BeaconData[13] =-1920;
	BeaconData[14] =-1920;
	BeaconData[15] =-1920;
	BeaconData[16] =-1920;
	BeaconData[17] =-1920;
	BeaconData[18] =-1920;
	BeaconData[19] =-1920;
	BeaconData[20] =-1920;
	BeaconData[21] =-1920;
	BeaconData[22] =-1920;
	BeaconData[23] =-1920;
	BeaconData[24] =-1920;
	BeaconData[25] =-1920;
	BeaconData[26] =-1920;
	BeaconData[27] =-1920;
	BeaconData[28] =-1577;
	BeaconData[29] = -798;
	BeaconData[30] =    3;
	BeaconData[31] =  804;
	BeaconData[32] = 1585;
	BeaconData[33] = 1920;
	BeaconData[34] = 1920;
	BeaconData[35] = 1920;
	BeaconData[36] = 1920;
	BeaconData[37] = 1920;
	BeaconData[38] = 1920;
	BeaconData[39] = 1920;
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
	
	initial begin
		i_press = 0;
	Pressure[0]  = 1920;
	Pressure[1]  = 1920;
	Pressure[2]  = 1920;
	Pressure[3]  = 1920;
	Pressure[4]  = 1920;
	Pressure[5]  = 1920;
	Pressure[6]  = 1920;
	Pressure[7]  = 1920;
	Pressure[8]  = 1920;
	Pressure[9]  = 1920;
	Pressure[10] = 1580;
	Pressure[11] = 1028;
	Pressure[12] = 226;
	Pressure[13] = -384;
	Pressure[14] = -990;
	Pressure[15] = -1580;
	Pressure[16] = -1920;
	Pressure[17] = -1920;
	Pressure[18] = -1920;
	Pressure[19] = -1920;
	Pressure[20] = -1920;
	Pressure[21] = -1920;
	Pressure[22] = -1920;
	Pressure[23] = -1920;
	Pressure[24] = -1920;
	Pressure[25] = -1920;
	Pressure[26] = -1920;
	Pressure[27] = -1920;
	Pressure[28] = -1920;
	Pressure[29] = -1920;
	Pressure[30] = -1920;
	Pressure[31] = -1920;
	Pressure[32] = -1920;
	Pressure[33] = -1920;
	Pressure[34] = -1920;
	Pressure[35] = -1920;
	Pressure[36] = -1580;
	Pressure[37] = -990;
	Pressure[38] = -384;
	Pressure[39] = 226;
	Pressure[40] = 1028;
	Pressure[41] = 1580;
	Pressure[42] = 1920;
	Pressure[43] = 1920;
	Pressure[44] = 1920;
	Pressure[45] = 1920;
	Pressure[46] = 1920;
	Pressure[47] = 1920;
	Pressure[48] = 1920;
	Pressure[49] = 1920;
	Pressure[50] = 1920;
	Pressure[51] = 1920;	
	end
//At every positive edge of the clock, output a BeaconData wave sample.
    always@ (posedge(clk))
    begin
	if(enableBeacon)
	begin
		MPPsignal_out = BeaconData[i];
        	i = i+ 1;
        	if(i == 40)
            	i = 0;
	end
	else
		if (enableDigitalLF)
		begin
			MPPsignal_out = DigitalLF[i_digLF];
			i_digLF = i_digLF+1;
			if (i_digLF == 23)
				i_digLF = 0;
		end
		else
			if (enablePressure)
			begin
				MPPsignal_out = Pressure[i_press];
				i_press = i_press+1;
				if (i_press == 52)
					i_press = 0;
			end
			else
				MPPsignal_out = 0;
    end
endmodule

