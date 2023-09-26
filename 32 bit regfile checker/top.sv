module top(input wire [2:0] selm,seld,
			  input wire clk,clki,we3,
			  input wire [7:0] src,
			  output wire [6:0] hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7);
	
	wire [31:0] wd3,rd1,rd2;
	wire [4:0] a1,a2,a3;

	input_demux in(seld,src,clki,wd3,a1,a2,a3);
	regfile rgfile(clk,we3,a1,a2,a3,wd3,rd1,rd2);
	output_mux out(a1,a2,a3,rd1,rd2,wd3,selm,hex7,hex6,hex5,hex4,hex3,hex2,hex1,hex0);
	
endmodule
