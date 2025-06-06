module test_sum5;
	reg [4:0] Ain_r, Bin_r;
	reg Ci_r;
	wire [4:0] Ain, Bin;
	wire Ci;
	wire [4:0] res_sum5, res_ref;
	wire cm, cr;

	assign Ain = Ain_r;
	assign Bin = Bin_r;
	assign Ci  = Ci_r;

	my_sum5 sum5 (Ain, Bin, Ci, res_sum5, cm);
	ref_sum ref (Ain, Bin, Ci, res_ref, cr);

	initial begin
		$display("Time\tAin\tBin\tCi\tMy_Out\tRef_Out\tEqual");
		$monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, Ain, Bin, Ci, res_sum5, res_ref, (res_sum5 == res_ref && cm == cr));
    
		Ain_r = 5'b00001; Bin_r = 5'b00010; Ci_r = 0;
		#50;
		Ain_r = 5'b10101; Bin_r = 5'b01010; Ci_r = 1;
		#50;
		Ain_r = 5'b11111; Bin_r = 5'b00001; Ci_r = 0;
		#50;
		Ain_r = 5'b11111; Bin_r = 5'b11111; Ci_r = 1;
		#50;
		Ain_r = 5'b00000; Bin_r = 5'b00000; Ci_r = 0;
		#50;
		$finish;
	end
endmodule
