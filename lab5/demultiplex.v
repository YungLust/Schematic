module demultiplex (
	input  [3:0] data_in, // 4 bit input
	input  [2:0] selector, // input for choosing output 
	output reg [3:0] data_out0,
	output reg [3:0] data_out1,
	output reg [3:0] data_out2,
	output reg [3:0] data_out3,
	output reg [3:0] data_out4

);
always @(*) begin
	//place 0 in all outputs
	data_out0 = 4'b0000;
	data_out1 = 4'b0000;
	data_out2 = 4'b0000;
	data_out3 = 4'b0000;
	data_out4 = 4'b0000;

	// depending on selector value choose the output to put data_in value
	case (selector)
		3'd0: data_out0 = data_in;
		3'd1: data_out1 = data_in;
		3'd2: data_out2 = data_in;
		3'd3: data_out3 = data_in;
		3'd4: data_out4 = data_in;
		default: ; // if none of the outputs is chosen - do nothing
	endcase
end

endmodule
