module sine_wave_gen(Clk,data_out);
	// input and output
    input Clk;
    output reg [7:0] data_out;
	// sine ROM - 24 registers each 8 bit wide.  
    reg [7:0] sine [0:23];
	//Internal  
    integer i;  
    // every positive edge of clock, output sine wave.
    always@ (posedge(Clk))
    begin
        data_out = sine[i];
        i = i+ 1;
        if(i == 24)
            i = 0;
    end
	//Initialize the sine rom with samples. 
    initial begin
        i 		 =      0;
		sine[0]  =      0; // Sample(1)
		sine[1]  =      6; // Sample(2)
		sine[2]  =     12; // Sample(3)
		sine[3]  =     17; // Sample(4)
		sine[4]  =     21; // Sample(5)
		sine[5]  =     23; // Sample(6)
		sine[6]  =     24; // Sample(7)
		sine[7]  =     23; // Sample(8)
		sine[8]  =     21; // Sample(9)
		sine[9]  =     17; // Sample(10)
		sine[10] =     12; // Sample(11)
		sine[11] =      6; // Sample(12)
		sine[12] =      0; // Sample(13)
		sine[13] =     -6; // Sample(14)
		sine[14] =    -12; // Sample(15)
		sine[15] =    -17; // Sample(16)
		sine[16] =    -21; // Sample(17)
		sine[17] =    -23; // Sample(18)
		sine[18] =    -24; // Sample(19)
		sine[19] =    -23; // Sample(20)
		sine[20] =    -21; // Sample(21)
		sine[21] =    -17; // Sample(22)
		sine[22] =    -12; // Sample(23)
		sine[23] =     -6; // Sample(24)

    end
endmodule
