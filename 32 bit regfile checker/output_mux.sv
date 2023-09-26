module output_mux(input wire [4:0] a1,a2,a3,
						input wire [31:0] rd1_bus,rd2_bus,wd3_bus,
						input wire [2:0] selm,
						output wire [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
						
	wire [31:0] a1_bus,a2_bus,a3_bus;
	wire [31:0] out_bus;
						
	assign a1_bus={27'b000000000_000000000_000000000,a1};
	assign a2_bus={27'b000000000_000000000_000000000,a2};
	assign a3_bus={27'b000000000_000000000_000000000,a3};
						
	always_comb begin
    case (selm)
        3'b000: out_bus = rd1_bus;
        3'b001: out_bus = rd2_bus;
        3'b010: out_bus = wd3_bus;
        3'b011: out_bus = a1_bus;
        3'b100: out_bus = a2_bus;
        3'b101: out_bus = a3_bus;
        default: out_bus = 32'h00000000;
    endcase
	end
					  
	hexcoder h0(out_bus[3:0],HEX0);
	hexcoder h1(out_bus[7:4],HEX1);
	hexcoder h2(out_bus[11:8],HEX2);
	hexcoder h3(out_bus[15:12],HEX3);
	hexcoder h4(out_bus[19:16],HEX4);
	hexcoder h5(out_bus[23:20],HEX5);
	hexcoder h6(out_bus[27:24],HEX6);
	hexcoder h7(out_bus[31:28],HEX7);
endmodule
