# RV32I-Single-Cycle-Processor

ISA : RV32I except privilaged instructions and fence instruction.

DE2-115 Fpga Board implementation

## clk         : KEY0;
## reset       : KEY1
## flags       : LEDR[3:0] {o,v,n,z}

## internal bus display SW[3:0]

  0000: out_bus = instr;
  
  0001: out_bus = rd1;
  
  0010: out_bus = rd2;
  
  0011: out_bus = immext;
  
  0100: out_bus = alu_src_out;
  
  0101: out_bus = alu_out;
  
  0110: out_bus = dmem_out;
  
  0111: out_bus = pcplus4;
  
  1000: out_bus = result;
  
  1001: out_bus = rd2_out;
  
  1010: out_bus = result_out;
  
  1011: out_bus = wdmux_out;
  
  1100: out_bus = pcnext;
  
  1101: out_bus = pc;
  
  1110: out_bus = pctarget;
  
  1111: out_bus = control;
