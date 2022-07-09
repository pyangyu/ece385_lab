//4-bit logic processor top level module
//for use with ECE 385 Spring 2021
//last modified by Zuofu Cheng


//Always use input/output logic types when possible, prevents issues with tools that have strict type enforcement

module Processor (input logic   Clk,     // Internal
                                Reset,   // Push button 0
                                Execute,   // Push button 1
                                ClearXA_LoadB,   // Push button 2
                  input  logic [7:0]  Din,     // input data
				  //Hint for SignalTap, you want to comment out the following 2 lines to hardwire values for F and R
//                  input  logic [2:0]  F,       // Function select 
//                  input  logic [1:0]  R,       // Routing select
//                  output logic [3:0]  LED,     // DEBUG
						output logic X, M, // the X unit holding the shift_out
												 // the M holds the least significant bit of B
                  output logic [7:0]  Aval,    // DEBUG
                                Bval,    // DEBUG					
                  output logic [6:0]  AhexL,
                                AhexU,
                                BhexL,
                                BhexU);

	 //local logic variables go here
	 logic Reset_SH, ClearXA_LoadB_SH, Execute_SH;
//	 logic [2:0] F_S;
//	 logic [1:0] R_S;
	 logic Ld_X, Out_X, In_X;
	 logic Out_A_Least_Bit, Out_B_Least_Bit; // Out from A and head to B
	 logic sub_flag;
	 logic [7:0] In_S;            // the value in register S
	 logic [7:0] A, B;
	 logic [8:0] Out_ADD_SUB_Adder;
	 logic clear_RegA, send_RegB, clear_BitX;
	 logic shift_enable;
	 logic Add_En, Sub_En;
	 logic free_add_one;
	 
	 assign free_add_one = 0;
	 
	 // Error (10161): object "clear_SH" is not declared. Verify the object name is correct. If the name is correct, declare the object.

	 assign clear_RegA = (Reset_SH | send_RegB | ClearXA_LoadB_SH);
	 
	 
	 assign M = B[0];
	 assign sub_flag = M & Sub_En;  // when sub is reached, and the last significant bit of B, aka M, is 1, then enable the sub_flag
	 
	 
	 //We can use the "assign" statement to do simple combinational logic
	 assign Aval = A;
	 assign Bval = B;
	 assign X = Out_X;
	 //assign LED = {Execute_SH,LoadA_SH,LoadB_SH,Reset_SH}; //Concatenate is a common operation in HDL
	 
	 //Note that you can hardwire F and R here with 'assign'. What to assign them to? Check the demo points!
	 //Remember that when you comment out the ports above, you will need to define F and R as variables
	 //uncomment the following lines when you hardwaire F and R (This was the solution to the problem during Q/A)
	 //logic [2:0] F;
	 //logic [1:0] R;
	 //assign F = something;
	 //assign R = something;
	 
	 //Instantiation of modules here
	 
	 // the bit in more accurate name:
	 assign In_X = Out_ADD_SUB_Adder[8];
	 assign clear_BitX = clear_RegA;
	 
	 // load two units which are logic unit a and logic unit B
	 x_unit 				value_X (
								.Clk(Clk),
								.Load(Add_En),  //.Load(Ld_X),
								.Reset(clear_BitX),
								.Bit(In_X),
								.X(Out_X) // hold the output value of X
										);
										
	ripple_adder		adder_nine_bit(
								.A(A),
								.B(In_S),
								.cin(free_add_one),
								.M(M),
								.flag(sub_flag),
								.S(Out_ADD_SUB_Adder),
								.cout()
								);
	 
	 
	 register_unit    reg_unitA (
                        .Clk(Clk),
                        .Reset(clear_RegA),
                        .Shift_In(Out_X),
                        .Load(Add_En),
								.Shift_En(shift_enable),
                        .D(Out_ADD_SUB_Adder[7:0]),
								.Shift_out(Out_A_Least_Bit),
								.Data_Out(A)
								);
								
								
	 register_unit    reg_unitB (
                        .Clk(Clk),
                        .Reset(Reset_SH),
                        .Shift_In(Out_A_Least_Bit),
                        .Load(ClearXA_LoadB_SH),
								.Shift_En(shift_enable),
                        .D(In_S),
								.Shift_out(Out_B_Least_Bit),
								.Data_Out(B)
								);
								
	// for register S, we can store the value in the module. ?
										
												
	 control          control_unit (
                        .Clk(Clk),
                        .Reset(Reset_SH),
                        .Execute(Execute_SH),
                        .Shift(shift_enable),
                        .Add(Add_En),
                        .Sub(Sub_En),
								.goToB(send_RegB)
								);
								
								
								
	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(BhexL) );
								
	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(AhexU) );	
	 HexDriver        HexBU (
                       .In0(B[7:4]),
                        .Out0(BhexU) );
								
	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments
	  sync button_sync[2:0] (Clk, {~Reset, ~ClearXA_LoadB, ~Execute}, {Reset_SH, ClearXA_LoadB_SH, Execute_SH});
	  sync Din_sync[7:0] (Clk, Din, In_S);
//	  sync F_sync[2:0] (Clk, F, F_S);
//	  sync R_sync[1:0] (Clk, R, R_S);
	  
endmodule
