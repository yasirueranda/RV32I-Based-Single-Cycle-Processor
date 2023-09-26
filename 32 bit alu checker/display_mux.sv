module display_mux(sel,Bus_A,Bus_B,Bus_C,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
	input wire [1:0] sel;
	input wire [31:0] Bus_A,Bus_B,Bus_C;
	output wire [6:0] HEX0;
	output wire [6:0] HEX1;
	output wire [6:0] HEX2;
	output wire [6:0] HEX3;
	output wire [6:0] HEX4;
	output wire [6:0] HEX5;
	output wire [6:0] HEX6;
	output wire [6:0] HEX7;
	
	wire [31:0] out_bus;
	
	assign out_bus=sel[0]? Bus_A : (sel[1]? Bus_B : Bus_C );
	
	hexcoder h0(out_bus[3:0],HEX0);
	hexcoder h1(out_bus[7:4],HEX1);
	hexcoder h2(out_bus[11:8],HEX2);
	hexcoder h3(out_bus[15:12],HEX3);
	hexcoder h4(out_bus[19:16],HEX4);
	hexcoder h5(out_bus[23:20],HEX5);
	hexcoder h6(out_bus[27:24],HEX6);
	hexcoder h7(out_bus[31:28],HEX7);
	
endmodule