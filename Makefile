registerfile: register_file.sv register_file_tb.sv
	iverilog -o registerfile register_file_tb.sv
	vvp registerfile
	gtkwave register_file_testing.vcd

instructionmemory: instruction_memory.sv instruction_memory_tb.sv program.mem
		iverilog	-o instructionmemory instruction_memory_tb.sv
		vvp instructionmemory
		gtkwave instruction_memory_testing.vcd
