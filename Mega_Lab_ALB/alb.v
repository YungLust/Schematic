module alb (
	input [9:0] A, B,
	input CI,
	input [2:0] ALB_MI,
	output [9:0] F,
	output CO, VO, NO, ZO
);
	wire [9:0] add_res, sub_res, or_res, and_res, xor_res;
	wire co_add, co_sub;

	adder ADD (.A(A), .B(B), .CI(CI), .SUM(add_res), .CO(co_add));
	subtractor SUB (.A(A), .B(B), .CI(CI), .DIFF(sub_res), .CO(co_sub));
	logic_units LOG (.A(A), .B(B), .OR_R(or_res), .AND_R(and_res), .XOR_R(xor_res));

	mux8to1 MUX (
		.sel(ALB_MI),
		.in0(add_res),
		.in1(sub_res),
		.in2(sub_res),
		.in3(or_res),
		.in4(and_res),
		.in5(and_res),
		.in6(xor_res),
		.in7(xor_res),
		.out(F)
	);

	assign CO = (ALB_MI == 3'b000) ? co_add :
			(ALB_MI == 3'b001 || ALB_MI == 3'b010) ? co_sub : 0;
	assign NO = F[9];
	assign ZO = (F == 10'b0);
	assign VO = CO ^ F[9]; //overflow
endmodule

