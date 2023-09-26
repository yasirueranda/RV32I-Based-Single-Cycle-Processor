module input_demux(input wire [2:0] seld,
						 input wire [7:0] data_in,
						 input wire clki,
						 output reg [31:0] wd3,
						 output reg [4:0] a1,a2,a3);
	
	wire [8:0] outd_0,outd_1,outd_2,outd_3;
	wire [5:0] outa_0,outa_1,outa_2;
	
	
	assign outd_0 = (seld==3'b000) ? {data_in,clki} : 9'b000000001;
	assign outd_1 = (seld==3'b001) ? {data_in,clki} : 9'b000000001;
	assign outd_2 = (seld==3'b010) ? {data_in,clki} : 9'b000000001;
	assign outd_3 = (seld==3'b011) ? {data_in,clki} : 9'b000000001;
	assign outa_0 = (seld==3'b100) ? {data_in[4:0],clki} : 6'b000001;
	assign outa_1 = (seld==3'b101) ? {data_in[4:0],clki} : 6'b000001;
	assign outa_2 = (seld==3'b110) ? {data_in[4:0],clki} : 6'b000001;
	
	always @(negedge outd_0[0]) begin
		wd3[7:0]<=outd_0[8:1];
	end
	always @(negedge outd_1[0]) begin
		wd3[15:8]<=outd_1[8:1];
	end
	always @(negedge outd_2[0]) begin
		wd3[23:16]<=outd_2[8:1];
	end
	always @(negedge outd_3[0]) begin
		wd3[31:24]<=outd_3[8:1];
	end
	always @(negedge outa_0[0]) begin
		a1<=outa_0[5:1];
	end
	always @(negedge outa_1[0]) begin
		a2<=outa_1[5:1];
	end
	always @(negedge outa_2[0]) begin
		a3<=outa_2[5:1];
	end
endmodule
	