// we need to change register unit because the data is from 4 bit to 8 bit
// notice that the module declaration is similar to a datasheet.

// Puyu: 06/23

// register_unit is module name
// the things behind is port declaration


// add a unit to hold X

// Besides, we have a X unit to hold the bit that shift out from register B
module x_unit 
(
	input		Clk, Load, Reset, Bit,
	output	logic X
);


	always_ff @ (posedge Clk)
	begin
			if (Reset)
				X <= 1'b0;
			else
				if (Load)
					X <= Bit;
				else
					X <= X;
	end 
endmodule


module register_unit (input  logic Clk, Reset, Shift_In, Load, Shift_En,
                      input  logic [7:0]  D, // data but from 3-0 to 7-0
                      output logic Shift_out,
                      output logic [7:0]  Data_out);


	// .* means that:
	// 				Automatically connects everrything else which fits the criteria e.g. .clk(clk), .B(B)

	always_ff @ (posedge Clk)
    begin
	 	 if (Reset) // Synchronous Reset
			  Data_Out <= 8'h0;
		 else if (Load)
			  Data_Out <= D;
		 else if (Shift_En)
		 begin
			  Data_Out <= { Shift_In, Data_Out[7:1] }; 
	    end
    end
	
    assign Shift_Out = Data_Out[0];

endmodule


