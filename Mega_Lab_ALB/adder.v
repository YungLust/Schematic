module adder (
	input [9:0] A, B,
	input CI,
	output [9:0] SUM,
	output CO
);
	assign {CO, SUM} = A + B + CI;
endmodule
