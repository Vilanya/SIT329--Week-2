`timescale 1ns/1ns

module alu 
	(
		input [3:0] a,
		input [3:0] b,
		input [1:0] op,

		output reg [3:0] out,
		output reg overflow
	);

	always @* begin
		overflow = 0;
		
		case(op)
			2'b00: {overflow, out} = a + b; // Add
			2'b01: {overflow, out} = a - b; // Subtract
          	2'b10: {overflow, out} = a * b; // Multiply
          2'b11: {overflow, out} = a / b; // Divide
			default: out <= a + b;
		endcase
	end

endmodule
