`include "alu.sv"

`timescale	1 ps / 1 ps

module	alu_tb;
	reg [63:0] a, b;
	reg [3:0] op;

	wire [63:0] out;
	wire isZero;

	alu alu0(
		.a(a),
		.b(b),
		.op(op),
		.out(out),
		.zero(isZero)
	);

	initial begin
		$dumpfile("alu_testing.vcd");
		$dumpvars(0, alu_tb);
		op = 4'b0000;
		/* testing add */

		a = 0;
		b = 0;
		/* output shoud be zero */
		#115
		a = 1;
		b = 2;
		/* output shoud be 3 */
		#200;
	end


endmodule
