/* alu support 4 operations
	and, or, add, and sub
	Inputs:
		a, b 64bit values
		op 4 bit opcode
	Outputs:
		zero single wire to indicate if the result was zero
		out is 64 bit result

	0000 => add
	1000 => sub
	0111 => and
	0110 => or
*/

`timescale 1 ps / 1 ps

module	alu(
	input wire [63:0] a, b,
	input wire [3:0] op,
	output wire [63:0] out,
	output wire zero
);

	reg[63:0] result;
	reg tmp;

	assign out = result;
	assign zero = tmp;

	always @ (a or b or op) begin
		#100
		case (op)
		4'b0000:
			result = a + b;
		4'b1000:
			result = a - b;
		4'b0111:
			result = a & b;
		4'b0110:
			result = a | b;
		endcase
		if (result == 4'b0000)
			tmp = 1'b1;
		else
			tmp = 1'b0;
	end

endmodule
