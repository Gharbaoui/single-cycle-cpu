`include "divideby3FSM.sv"

module	divideby3FSM_tb;

	reg clk, reset;
	wire q;

	divideby3FSM u0(
		.clk(clk),
		.reset(reset),
		.q(q)
	);

	initial begin
		clk = 0;
		forever
			#6 clk = ~clk;
	end

	initial begin
		$dumpfile("divideby3fsm_test.vcd");
		$dumpvars(0, divideby3FSM_tb);
		reset = 0;
		#25 $finish;
	end
endmodule
