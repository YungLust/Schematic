module ref_sum(Ain, Bin, Ci, Sout, Co);
	input [4:0] Ain, Bin;
	input Ci;
	output [4:0] Sout;
	output Co;

	reg [5:0] temp;

	always @(*) begin
		temp = Ain + Bin + Ci;
	end

	assign Sout = temp[4:0];
	assign Co   = temp[5];
endmodule

