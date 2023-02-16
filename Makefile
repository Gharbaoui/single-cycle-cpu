registerfile: register_file.sv register_file_tb.sv
	iverilog -o registerfile register_file_tb.sv
	vvp registerfile
	gtkwave register_file_testing.vcd
