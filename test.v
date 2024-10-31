module test_bench;
// Inputs and Outputs
reg clk;
reg reset;
reg [1:0] fsm_input;
wire [1:0] fsm_output;
// Instantiate the FSM
my_fsm fsm_1 (
.clk(clk),
.reset(reset),
.fsm_input(fsm_input),
.fsm_output(fsm_output)
);
// Generate the clock signal
initial begin
clk = 0;
forever #5 clk = ~clk; // Toggle clock every 5 time unit
end
// Stimulus generation
initial begin
reset = 1; // Assert reset
fsm_input = 2'b00; // Initial input
#10; // Wait for some time
reset = 0; // Deassert reset
// Test various inputs
#10 fsm_input = 2'b00; // Test input 00
#10 fsm_input = 2'b01; // Test input 01

VDF Assignment 2 8

#10 fsm_input = 2'b10; // Test input 10
#10 fsm_input = 2'b11; // Test input 11
reset = 1;
#10
reset = 0;
// Test state s1
#10 fsm_input = 2'b00; // s1, input 00
#10 fsm_input = 2'b01; // s1, input 01
#10 fsm_input = 2'b10; // s1, input 10
#10 fsm_input = 2'b11; // s1, input 11
// Test state s2
#10 fsm_input = 2'b00; // s2, input 00
#10 fsm_input = 2'b01; // s2, input 01
#10 fsm_input = 2'b10; // s2, input 10
#10 fsm_input = 2'b11; // s2, input 11
// Test state s3
#10 fsm_input = 2'b00; // s3, input 00
#10 fsm_input = 2'b01; // s3, input 01
#10 fsm_input = 2'b10; // s3, input 10
#10 fsm_input = 2'b11; // s3, input 11
// Test state s4
#10 fsm_input = 2'b00; // s4, input 00
#10 fsm_input = 2'b01; // s4, input 01
#10 fsm_input = 2'b10; // s4, input 10
#10 fsm_input = 2'b11; // s4, input 11
#10 fsm_input = 2'b00; // Test input 00
#10 fsm_input = 2'b01; // Test input 01
#10 fsm_input = 2'b10; // Test input 10
#10 fsm_input = 2'b11; // Test input 11
#10 fsm_input = 2'b00; // Test input 00
#10 fsm_input = 2'b11; // Test input 00
#10 fsm_input = 2'b10; // Test input 10

VDF Assignment 2 9

#10 fsm_input = 2'b10; // Test input 10
#10 fsm_input = 2'b00; // Test input 00
#10 fsm_input = 2'b01; // Test input 01
#10 fsm_input = 2'b01; // Test input 01
#10 fsm_input = 2'b10; // Test input 10
#10 fsm_input = 2'b11; // Test input 00
#10 fsm_input = 2'b01; // Test input 01
#10 fsm_input = 2'b01; // Test input 01
#10 fsm_input = 2'b10; // Test input 10
#10 fsm_input = 2'b11; // Test input 00
#10 fsm_input = 2'b10; // Test input 10
// Finish simulation
#10;
$finish; // End simulation
end
// Monitor outputs
initial begin
$monitor("Time: %0t | Reset: %b | Input: %b | Output: %b
$time, reset, fsm_input, fsm_output);
end
// Generate VCD dump
initial begin
$dumpfile("count.vcd");
$dumpvars(0);
end
endmodule
