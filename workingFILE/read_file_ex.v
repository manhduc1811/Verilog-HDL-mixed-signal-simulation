module read_file_ex;
    reg a, b;
    reg[1:0] sum_carry_expected; 
    reg[3:0] read_data [0:5];
    integer i;
    initial begin 
        $readmemb("adder_data.txt", read_data);
        for (i=0; i<6; i=i+1)
        begin
            {a, b, sum_carry_expected} = read_data[i]; 
			$display("%b,%b,%b",a,b,sum_carry_expected);
            #20;        
        end
    end
    //initial begin
	//$shm_open("./read_file_ex.shm");
	//$shm_probe(read_file_ex,"AS");
    //end
endmodule
