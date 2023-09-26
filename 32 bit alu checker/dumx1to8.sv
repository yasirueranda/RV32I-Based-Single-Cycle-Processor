module dumx1to8 (
  input wire [2:0] select,  // 3-bit selection signal
  input wire [8:0] data_in,      // Input data to be demultiplexed
  output wire [8:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7 // 8 output lines
);

assign out_0 = (select == 3'b000) ? data_in : 9'b000000001;
assign out_1 = (select == 3'b001) ? data_in : 9'b000000001;
assign out_2 = (select == 3'b010) ? data_in : 9'b000000001;
assign out_3 = (select == 3'b011) ? data_in : 9'b000000001;
assign out_4 = (select == 3'b100) ? data_in : 9'b000000001;
assign out_5 = (select == 3'b101) ? data_in : 9'b000000001;
assign out_6 = (select == 3'b110) ? data_in : 9'b000000001;
assign out_7 = (select == 3'b111) ? data_in : 9'b000000001;

endmodule
