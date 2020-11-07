module write_file_ex;
	reg a, b, sum_expected, carry_expected;
	reg [3:0] read_data [0:5];

	integer write_data;
	integer i;
	
	initial begin
		$readmemb("adder_data.txt",read_data);
		write_data = $fopen("adder_data_write.txt");
		for (i=0; i<6; i=i+1) begin
			{a,b,sum_expected, carry_expected} = read_data[i];
			#20;
			//display file 
			//$display("%b,%b,%b,%b",a,b,sum_expected, carry_expected);
			//write data to file
			$fdisplay(write_data, "%b,%b,%b,%b",a,b,sum_expected,carry_expected);
		end
		$fclose(write_data);
	end		

	//initial begin
		//$shm_open("./write_file_ex.shm");
		//$shm_probe(write_file_ex,"AS");
	//end
endmodule