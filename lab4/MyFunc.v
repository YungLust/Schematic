module MyFunc(x1,x2,x3,f);
	input x1,x2,x3;
	output f;
	assign exp1 = ~(x3 | x2);
	assign exp2 = ~(x3 | ~x2 | ~x1);
	assign exp3 = ~(~x3 | x2 | ~x1);
	assign f = exp1 | exp2 | exp3;
endmodule