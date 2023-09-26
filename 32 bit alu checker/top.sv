module top(src,clk,flags,alucontrol,seld,selm,hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7);
	input wire [7:0] src;
	input wire clk;
	output wire [3:0] flags;
	input wire [3:0] alucontrol;
	input wire [2:0] seld;
	input wire [1:0] selm;
	output wire [6:0] hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7;
	
	wire [31:0] resultw;
	reg [31:0] result;
	wire [8:0] aw_0,aw_1,aw_2,aw_3,bw_0,bw_1,bw_2,bw_3;
	reg [7:0] a_0,a_1,a_2,a_3,b_0,b_1,b_2,b_3;
	
	dumx1to8 dmux1(seld,{src,clk},aw_0,aw_1,aw_2,aw_3,bw_0,bw_1,bw_2,bw_3);
	
	always @(negedge aw_0[0]) begin
		a_0<=aw_0[8:1];
	end
	always @(negedge aw_1[0]) begin
		a_1<=aw_1[8:1];
	end
	always @(negedge aw_2[0]) begin
		a_2<=aw_2[8:1];
	end
	always @(negedge aw_3[0]) begin
		a_3<=aw_3[8:1];
	end
	always @(negedge bw_0[0]) begin
		b_0<=bw_0[8:1];
	end
	always @(negedge bw_1[0]) begin
		b_1<=bw_1[8:1];
	end
	always @(negedge bw_2[0]) begin
		b_2<=bw_2[8:1];
	end
	always @(negedge bw_3[0]) begin
		b_3<=bw_3[8:1];
	end
	always @(negedge clk) begin
		result<=resultw;
	end
	
	
	/*always @(negedge clk)
	begin
		a_0<=aw_0;
		a_1<=aw_1;
		a_2<=aw_2;
		a_3<=aw_3;
		b_0<=bw_0;
		b_1<=bw_1;
		b_2<=bw_2;
		b_3<=bw_3;
		result<=resultw;
	end
	*/
	
	alu alu1({a_3,a_2,a_1,a_0},{b_3,b_2,b_1,b_0},alucontrol,resultw,flags);
	
	display_mux mux_1(selm,{a_3,a_2,a_1,a_0},{b_3,b_2,b_1,b_0},result,hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7);
	
endmodule
