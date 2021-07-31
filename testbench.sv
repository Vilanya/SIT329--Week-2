`timescale 1ns/1ns

module alu_tb;
	// Inputs
	reg [3:0] t_a;
	reg [3:0] t_b;
	reg [1:0] t_op;

	// Outputs
	wire [3:0] t_out;
	wire t_overflow;

	// Instantiate the Unit Under Test (UUT)
	alu UUT (
		.a(t_a),
		.b(t_b),
		.op(t_op),
		.out(t_out),
		.overflow(t_overflow)
	);

	initial begin
		$dumpfile("haout.vcd");
		$dumpvars(1, alu_tb);
		
		t_a = 0;
		t_b = 0;
		t_op = 2'b00;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 1 + 1 = 2
		t_a = 1;
		t_b = 1;
		t_op = 2'b00;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 1 + 2 = 3
		t_a = 1;
		t_b = 2;
		t_op = 2'b00;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 16 + 1 = 1 ; overflow
		t_a = 16;
		t_b = 1;
		t_op = 2'b00;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 13 + 4 = 1 ; overflow
		t_a = 13;
		t_b = 4;
		t_op = 2'b00;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
	
		// 3 - 1 = 2
		t_a = 3;
		t_b = 1;
		t_op = 2'b01;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 1 - 3 = 2
		t_a = 1;
		t_b = 3;
		t_op = 2'b01;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 20 - 3 = 1 ; overflow
		t_a = 20;
		t_b = 3;
		t_op = 2'b01;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 2 * 2 = 4
		t_a = 2;
		t_b = 2;
		t_op = 2'b10;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 1 * 4 = 4
		t_a = 1;
		t_b = 4;
		t_op = 2'b10;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 2 * 12 = 8 ; overflow
		t_a = 2;
		t_b = 12;
		t_op = 2'b10;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 10 / 5 = 2
		t_a = 10;
		t_b = 5;
		t_op = 02'b11;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 34 / 2 = 1 ; overflow
		t_a = 34;
		t_b = 2;
		t_op = 02'b11;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		$finish;
	end

endmodule
