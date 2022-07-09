module ripple_adder
(
	input  [7:0] A, B,
	input         	cin,
	input				M, flag, // M is the least significant bit of B
	output [8:0] S,
	output        	cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic c1, c2;
	  logic [7:0] B_in;
	  
	  
	  //Error (10170): Verilog HDL syntax error at ripple_adder.sv(18) near text: "=";  expecting ".", or "(". Check for and fix any syntax errors that appear immediately before or at the specified keyword. The Intel FPGA Knowledge Database contains many articles with specific details on how to resolve this error. Visit the Knowledge Database at https://www.altera.com/support/support-resources/knowledge-base/search.html and search for this specific error message number.
	  // assign B_in 
	  // B_in = 8'b0; // do not add S to A since M = 0;
	  
	  always_comb
	  begin
				// assign B_in 
				// B_in = 8'b0; // do not add S to A since M = 0;
				if(M == 1'b1) // bug, when M is 1, then add or sub; when M = 0, change all the bit to zero and add the 0 value
					B_in = B ^ {8{flag}}; // when flag == 0, add to A; when flag == 1, subtract when M = 1 and reach the 8th bit
				else 
					B_in = 8'b0; // do not add S to A since M = 0;
	  end
				
	  adder_four RA0(.A(A[3:0]), .B(B_in[3:0]), .c_in(flag), .S(S[3:0]), .c_out(c1));
	  adder_four RA1(.A(A[7:4]), .B(B_in[7:4]), .c_in(c1), .S(S[7:4]), .c_out(c2));
	  full_adder FA3(.x (A[7]), .y (B_in[7]), .z (c2), .s (S[8]), .c (cout)); // bug
 

endmodule	  

	  // reference: 12.1 Introduction to Quartus Tutorial.pdf
	  
	  
module full_adder (
					input		x, y, z,
					output	s, c);
					
	assign s = x^y^z;
	assign c = (x&y)|(y&z)|(x&z);

endmodule


module adder_four (
					input 	[3:0] A, B, 
					input 	c_in,
					output	[3:0] S,
					output logic	c_out);
	// Internal carries in the 4-bit adder
	logic c1, c2, c3;
	full_adder FA0 (.x (A[0]), .y (B[0]), .z (c_in), .s (S[0]), .c (c1));
	full_adder FA1 (.x (A[1]), .y (B[1]), .z (c1), .s (S[1]), .c (c2));
	full_adder FA2 (.x (A[2]), .y (B[2]), .z (c2), .s (S[2]), .c (c3));
	full_adder FA3 (.x (A[3]), .y (B[3]), .z (c3), .s (S[3]), .c (c_out));
endmodule


