`include "instruction_memory.sv"

module	instruction_memory_tb;
	reg [7:0] address;
	wire [31:0] ins;

	instruction_memory u0(
		.address(address),
		.ins(ins)
	);

	initial	begin
		$dumpfile("instruction_memory_testing.vcd");
		$dumpvars(0, instruction_memory_tb);
		/* read value at address zero should give the value of aa bb cc dd */
		address = 0;
		/* read value at address 255 should give the value of cc dd ee ff*/
		#210
		address = 255;
		#210
		/*read at any other place should give 00 00 00 00*/
		/* btw this values are stored in program.mem wich will hold out
		* program later */
		address = 30;
		#250;
	end

endmodule
