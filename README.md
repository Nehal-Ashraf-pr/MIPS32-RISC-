**MIPS32 Pipeline Processor**

**Project Overview**

This project implements a five-stage pipelined MIPS32 processor using Verilog and is simulated in Xilinx ISE. The processor supports arithmetic, logic, memory, and branching instructions with hazard mitigation techniques to ensure smooth execution.

**Features**

Five-stage pipeline: 

Instruction Fetch (IF)

Instruction Decode (ID)

Execute (EX)

Memory Access (MEM)

Write Back (WB)

Supports basic **R-type** and **I-type instructions** 

(ADD, SUB, AND, OR, SLT, MUL, ADDI, SUBI, SLTI, LW, SW, BEQZ, BNEQZ, HLT)


:: Hazard mitigation techniques

(Forwarding, Stalling, Branch Prediction)



**Memory** implemented using an array of **1024** locations



**Synthesizable and Simulatable in Xilinx ISE**

Pipeline Stages



**Instruction Fetch (IF):**

Fetches instruction from memory

Updates program counter (PC)



**Instruction Decode (ID):**

Decodes instruction and reads registers

Sign-extends immediate values



**Execute (EX):**

Performs ALU operations (arithmetic/logic/branch calculations)

Determines branch condition



**Memory Access (MEM):**

Reads/Writes data from/to memory



**Write Back (WB):**

Writes results back to registers



**Setup and Simulation**

**1. Environment Setup**

Install Xilinx ISE Design Suite

Clone the repository or download project files



**2. Running the Simulation**

Open Xilinx ISE and create a new project

Add pipe_MIPS32.v and pipe_MIPS32_tb.v to the project

Set pipe_MIPS32_tb.v as the top-level module

Run Behavioral Simulation

Observe waveforms in ISim



**3. Sample Test Cases**

Adding three numbers (10, 20, 25) and storing the result:

    Mem[0] = 32'h2801000a;  // ADDI R1,R0,10

    Mem[1] = 32'h28020014;  // ADDI R2,R0,20

    Mem[2] = 32'h28030019;  // ADDI R3,R0,25

    Mem[3] = 32'h00222000;  // ADD R4,R1,R2

    Mem[4] = 32'h00832800;  // ADD R5,R4,R3

    Mem[5] = 32'hfc000000;  // HALT



![image](https://github.com/user-attachments/assets/41c3dc92-813e-47a1-9fbe-005bf7ca4e9b)



  ![image](https://github.com/user-attachments/assets/b14faf3d-d1a3-41bc-b04f-fcc83e804202)




Q) Loading from memory and storing result:

    Mem[0] = 32'h28010078;  // ADDI R1,R0,120

    Mem[1] = 32'h20220000;  // LW R2,0(R1)

    Mem[2] = 32'h2842004d;  // ADDI R2,R2,77

    Mem[3] = 32'h24220001;  // SW R2,1(R1)

    Mem[4] = 32'hfc000000;  // HALT

![image](https://github.com/user-attachments/assets/b9fb32a8-82cd-4370-af9e-c895c10d6d27)

![image](https://github.com/user-attachments/assets/1b2fb4dc-bf9d-4b78-acd1-95c52669851e) ![image](https://github.com/user-attachments/assets/56fc2efa-5928-46c8-91ca-dc35764a3cad)




**Results**

The processor successfully executes arithmetic, logic, and memory operations.

The waveforms in ISim confirm correct pipeline execution with forwarding and branch handling.



**Future Improvements**

Implement Full Hazard Detection Unit to optimize stalling.

Extend instruction set to support additional operations.

Integrate cache memory for better performance.
