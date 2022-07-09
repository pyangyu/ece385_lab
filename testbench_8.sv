module testbench2();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset, Execute, ClearXA_LoadB;
logic X, M;
logic [7:0] Din;
logic [7:0] Aval,
		 Bval;
logic [6:0] AhexL,
		 AhexU,
		 BhexL,
		 BhexU; 

// To store expected results
logic [7:0] ans_1a, ans_2b;
				
// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design

//Error (10897): can't implicitly connect port "M" on instance "processor0" of module "Processor" - no such object is visible in the present scope

Processor lab3_processor(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
	Reset = 0;		// Toggle Rest
	Execute = 1;
	ClearXA_LoadB = 1;
	
	
	Din = 8'b11000101;	// number -59

	#2 Reset = 1;

	#2 ClearXA_LoadB = 0;	
	#2 ClearXA_LoadB = 1;

	#10 Din = 8'b00000111; // number 7	// Change Din
	
	#2 Execute = 0;

	#40 Execute = 1;

	//7 * -59 = -413
	ans_1a = 8'hfe;
	ans_2b = 8'h5d;

	if (Aval != ans_1a || Bval != ans_2b)
		ErrorCnt++;


if (ErrorCnt == 0)
	$display("Success!");  // Command line output in ModelSim
else
	$display("%d error(s) detected. Try again!", ErrorCnt);
end
endmodule
