`include "register_file.sv"

module	register_file_tb;

	reg[4:0] r1, r2, w;
	reg [63:0] wd;
	reg we;

	wire [63:0] out_r1, out_r2;

	register_file u0(
		.readRegister1(r1),
		.readRegister2(r2),
		.writeRegister(w),
		.writeData(wd),
		.regWrite(we),
		.readData1(out_r1),
		.readData2(out_r2)
	);

	initial begin
		$dumpfile("register_file_testing.vcd");
		$dumpvars(0, register_file_tb);

		r1 = 0;
		r2 = 0;
		we = 0;
		/* at first data should be zero */
		#210
		w = 0; // write to register 0
		wd = 8; // data to be written
		/* should not update register file cuz we is false */
		#210
		we = 1;
		#240;
		
	end

endmodule
