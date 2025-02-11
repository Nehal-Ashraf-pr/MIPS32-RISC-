`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:52:39 01/22/2025
// Design Name:   pipe_MIPS32
// Module Name:   C:/Users/DELL/Desktop/ISEex/Verilog/RISC/INTRO/pipe_MIPS32_tb.v
// Project Name:  INTRO
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_MIPS32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_MIPS32_tb;

	// Inputs
	reg clk1;
	reg clk2;
   integer k;
reg [31:0] PC, IF_ID_IR, IF_ID_NPC;
reg [31:0] ID_EX_IR, ID_EX_NPC, ID_EX_A, ID_EX_B, ID_EX_Imm;
reg [2:0]  ID_EX_type, EX_MEM_type, MEM_WB_type;
reg [31:0] EX_MEM_IR, EX_MEM_ALUOut, EX_MEM_B;
reg        EX_MEM_cond;
reg [31:0] MEM_WB_IR, MEM_WB_ALUOut, MEM_WB_LMD;
reg [31:0] Reg [0:31];
reg [31:0] Mem[0:1023];
reg HALTED;

reg TAKEN_BRANCH;

	// Instantiate the Unit Under Test (UUT)
	pipe_MIPS32 mips (
		.clk1(clk1), 
		.clk2(clk2)
	);

	initial 
	  begin
		// Initialize Inputs
		clk1 = 0;
		clk2 = 0;
      repeat(50)
         begin
            #5 clk1 = 1;  #5 clk1 = 0; 				
            #5 clk2 = 1;  #5 clk2 = 0; 								
		// Add stimulus here
		   end
		end
      
	initial
	    begin
		    for(k=0;k<31;k=k+1)
			   mips.Reg[k] =k;
				
	/* mips.Mem[0] = 32'h2801000a;  // ADDI R1,R0,10
		mips.Mem[1] = 32'h28020014;  // ADDI R2,R0,20
		mips.Mem[2] = 32'h28030019;  // ADDI R3,R0,25
		mips.Mem[3] = 32'h0ce77800;  // OR R7,R7,R7
		mips.Mem[4] = 32'h0ce77800;  // OR R7,R7,R7		
		mips.Mem[5] = 32'h00222000;  // ADD R4,R1,R2
      mips.Mem[6] = 32'h0ce77800;  // OR R7,R7,R7
		mips.Mem[7] = 32'h00832800;  // ADDI R5,R4,R3
		mips.Mem[8] = 32'hfc000000;  // HALT
	*/
		mips.Mem[0] = 32'h28010078;  // ADDI R1,R0,120
		mips.Mem[1] = 32'h0ce77800;  // OR R7,R7,R7
		mips.Mem[2] = 32'h20220000;  // LW R2,0(R1)
		mips.Mem[3] = 32'h0ce77800;  // OR R7,R7,R7		
		mips.Mem[4] = 32'h2842004d;  // ADDI R2,R2,45
      mips.Mem[5] = 32'h0ce77800;  // OR R7,R7,R7
		mips.Mem[6] = 32'h24220001;  // SW R2,1(R1)
		mips.Mem[7] = 32'hfc000000;  // HALT
		
		mips.Mem[120] = 123;
		
		mips.HALTED = 0;
		mips.PC = 0;
		mips.TAKEN_BRANCH = 0;
		
		#300
		for (k=0;k<10;k=k+1)
		    $display("R%1d - %2d",k,mips.Reg[k]);
		#500		    
		$display("Mem[120]: %4d \nMem[121]:  %4d",mips.Mem[120],mips.Mem[121]);
	end
	
	/*initial
	  begin
	   $dumpfile ("mips.vcd");
		$dumpvars(0,pipe_mips32_tb);
		#300 $finish
	end*/
endmodule

