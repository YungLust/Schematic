module subtractor (
	input [9:0] A, B,
	input CI,
	output [9:0] DIFF,
	output CO
);
	assign {CO, DIFF} = A + (~B) + CI;
endmodule