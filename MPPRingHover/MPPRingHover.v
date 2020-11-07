module MPPRingHover (clk,enablePortTypeHF,MPPsignal_out);
//declare input and output
    input clk;
    input enablePortTypeHF;
    output signed [23:0] MPPsignal_out;
//declare the PortTypeHF ROM - 40 registers each 8 bit wide.  
    reg signed [23:0] PortTypeHF [0:16];
//Internal signals  
    integer i_PortTypeHF;
    reg signed [23:0] MPPsignal_out; 
//Initialize the PortTypeHF rom with samples. 
    initial begin
        i_PortTypeHF = 0;
		PortTypeHF[0] =1920;
		PortTypeHF[1] =1920;
		PortTypeHF[2] =-1920;
		PortTypeHF[3] =-1920;
		PortTypeHF[4] =-1583;
		PortTypeHF[5] =1920;
		PortTypeHF[6] =1920;
		PortTypeHF[7] =800;
		PortTypeHF[8] =-1920;
		PortTypeHF[9] =-1920;
		PortTypeHF[10] =0;
		PortTypeHF[11] =1920;
		PortTypeHF[12] =1920;
		PortTypeHF[13] =-801;
		PortTypeHF[14] =-1920;
		PortTypeHF[15] =-1920;
		PortTypeHF[16] =1583;
    end
//At every positive edge of the clock, output a PortTypeHF wave sample.
    always@ (posedge(clk))
    begin
	if(enablePortTypeHF)
	begin
		MPPsignal_out = PortTypeHF[i_PortTypeHF];
        	i_PortTypeHF = i_PortTypeHF+ 1;
        	if(i_PortTypeHF == 17)
            	i_PortTypeHF = 0;
	end
	else
		MPPsignal_out = 0;
    end
endmodule

