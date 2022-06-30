//Two-always example for state machine

module control (input  logic Clk, Reset, Execute,
                output logic Shift, Add, Sub, goToB );

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    
	 // according to the lecture, we need 3 (start states) + 8 * 2 = 19 states
	 enum logic [5:0] {a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18}   curr_state, next_state; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= a0;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            a0 :   if (Execute)
                       next_state = a1;
            a1 :    next_state = a2;
            a2 :    next_state = a3;
            a3 :    next_state = a4;
            a4 :    next_state = a5;
				a5 :	  next_state = a6;
				a6 :	  next_state = a7;
				a7 : 	  next_state = a8;
				a8 : 	  next_state = a9;
            a9 :    next_state = a10;
				a10: 	  next_state = a11;
				a11: 	  next_state = a12;
				a12:    next_state = a13;
				a13: 	  next_state = a14;
				a14: 	  next_state = a15;
				a15: 	  next_state = a16;
				a16: 	  next_state = a17;
				a17:    next_state = a18;
				a18: 	 if (~Execute) 
                       next_state = a0;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   a0: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
	   	   a1: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b1;
		      end
				
				a2: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a3: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a4: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a5: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a6: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a7: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a8: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a9: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a10: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a11: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a12: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a13: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a14: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a15: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a16: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b1;
					Sub 		= 1'b1;
					goToB 	= 1'b0;
		      end
				
				a17: 
	         begin
					Shift 	= 1'b1;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
				a18: 
	         begin
					Shift 	= 1'b0;
					Add 		= 1'b0;
					Sub 		= 1'b0;
					goToB 	= 1'b0;
		      end
				
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
					begin
						Shift 	= 1'b0;
						Add 		= 1'b0;
						Sub 		= 1'b0;
						goToB 	= 1'b0;
					end
        endcase
    end

endmodule
