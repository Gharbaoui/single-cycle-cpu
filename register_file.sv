`timescale 1 ps / 1 ps

module	register_file(
	input [4:0] readRegister1, readRegister2, writeRegister,
	input [63:0] writeData,
	input regWrite,
	output reg [63:0] readData1, readData2
);

	integer i;

	reg [64:0] registers [31:0];

	initial begin
		for (i = 0; i < 32; ++i) begin
			registers[i] = 32'h00000000;
		end
	end


	always @ (
		readRegister1 or readRegister2 or
		writeRegister or writeData or regWrite
	) begin
		#200
		if (regWrite == 1'b1)
			registers[writeRegister] = writeData;
		readData1 = registers[readRegister1];
		readData2 = registers[readRegister2];
	end

endmodule
