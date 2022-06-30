// we need to change register unit because the data is from 4 bit to 8 bit
// notice that the module declaration is similar to a datasheet.

// Puyu: 06/23

// register_unit is module name
// the things behind is port declaration

module register_unit (input  logic Clk, Reset, A_In, B_In, Ld_A, Ld_B, 
                            Shift_En, // other pins one the chip
                      input  logic [7:0]  D, // data but from 3-0 to 7-0
                      output logic A_out, B_out, 
                      output logic [7:0]  A,  // output pins
                      output logic [7:0]  B);


	// .* means that:
	// 				Automatically connects everrything else which fits the criteria e.g. .clk(clk), .B(B)

	// same module reg_4 with different module names: reg_A and reg_B
	reg_4  reg_A (.*, .Shift_In(A_In), .Load(Ld_A),
	               .Shift_Out(A_out), .Data_Out(A));
   reg_4  reg_B (.*, .Shift_In(B_In), .Load(Ld_B),
	               .Shift_Out(B_out), .Data_Out(B));

endmodule
