module alb_tb;
	reg [9:0] A, B;
	reg CI;
	reg [2:0] ALB_MI;
	wire [9:0] F;
	wire CO, VO, NO, ZO;

	alb uut (.A(A), .B(B), .CI(CI), .ALB_MI(ALB_MI), .F(F), .CO(CO), .VO(VO), .NO(NO), .ZO(ZO));

	initial begin
		$display("ALB TESTING");

		// S1 = A1 + B1
		A = 10'b0110001110;
		B = 10'b1010010111;
		CI = 0;
		ALB_MI = 3'b000; #10;
		$display("S1 = %b, CO=%b VO=%b NO=%b ZO=%b", F, CO, VO, NO, ZO);

		// S2 = A1 + B2
		A = 10'b0110001110;
		B = ~10'b1010010111 + 1;
		ALB_MI = 3'b000; #10;
		$display("S2 = %b, CO=%b VO=%b NO=%b ZO=%b", F, CO, VO, NO, ZO);

		//D1 = A1 - B1
		A = 10'b0110001110;
		B = 10'b1010010111;
		ALB_MI = 3'b001; #10;
		$display("D1 = %b, CO=%b VO=%b NO=%b ZO=%b", F, CO, VO, NO, ZO);

		// D4 = A2 - B2
		A = ~10'b0110001110 + 1;
		B = ~10'b1010010111 + 1;
		ALB_MI = 3'b001; #10;
		$display("D4 = %b, CO=%b VO=%b NO=%b ZO=%b", F, CO, VO, NO, ZO);

		$finish;
	end
endmodule

