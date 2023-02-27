/*
	instruction memory will hold values of 32 bit
	hold 256 lines means we need address of 8
	line is 32 bit wide
*/


module	instruction_memory(
	input [63:0] address,
	output reg [31:0] ins
);

	reg [31:0] memory[0:255];

	initial	begin
		$readmemh("program.mem", memory);
	end

	always @ (address) begin
		#200
		ins <= memory[address];
	end

endmodule
