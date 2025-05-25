module logic_units (
	input [9:0] A, B,
	output [9:0] OR_R,
	output [9:0] AND_R,
	output [9:0] XOR_R
);
	assign OR_R = A | B;
	assign AND_R = A & B;
	assign XOR_R = A ^ B;
endmodule
