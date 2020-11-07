//The Verilog PWM (Pulse Width Modulation) generator creates a 10MHz PWM signal with variable duty cycle. 
//Two buttons which are debounced are used to control the duty cycle of the PWM signal. 
//The first push button is to increase the duty cycle by 10%, and the other button is to decrease the duty cycle by 10%. 

// PWM generate

module tb_PWM_Generator_Verilog;
	// Inputs
	reg clk;
	reg increase_duty;
	reg decrease_duty;
	// Outputs
	wire PWM_OUT;
	// Instantiate the PWM Generator with variable duty cycle in Verilog
	PWM_Generator PWM_Generator_Unit(
		.clk(clk), 
		.increase_duty(increase_duty), 
		.decrease_duty(decrease_duty), 
		.PWM_OUT(PWM_OUT)
	);
 // Create 100Mhz clock
 
 initial begin
	clk = 0;
	forever #5 clk = ~clk;
 end 
 
 initial begin
	increase_duty = 0;
	decrease_duty = 0;
	#100; 
    increase_duty = 1; 
	#100;// increase duty cycle by 10%
    increase_duty = 0;
	#100; 
    increase_duty = 1;
	#100;// increase duty cycle by 10%
    increase_duty = 0;
	#100; 
    increase_duty = 1;
	#100;// increase duty cycle by 10%
    increase_duty = 0;
	#100;
    decrease_duty = 1; 
	#100;//decrease duty cycle by 10%
    decrease_duty = 0;
	#100; 
    decrease_duty = 1;
	#100;//decrease duty cycle by 10%
    decrease_duty = 0;
	#100;
    decrease_duty = 1;
	#100;//decrease duty cycle by 10%
    decrease_duty = 0;
	#100; $finish;	
 end
 
//initial begin
//		$shm_open("./PWM_Generator_Verilog.shm");
//		$shm_probe(tb_PWM_Generator_Verilog,"AS");
//end
endmodule
