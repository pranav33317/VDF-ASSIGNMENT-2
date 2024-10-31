// now we will do one hot encoding
// every state is represented by singke bit set to 1 , with al e
// so new states are : 00001,00010,00100,01000,10000
// // we have states s1,s2,s3,s4,s5
// // States : {00001,00010,00100,01000,10000}
module my_fsm(
input wire clk,
input wire reset,
input wire [1:0] fsm_input,
output reg [1:0] fsm_output
);
// State definitions
reg [5:0] current_state, next_state;
parameter s0 = 5'b00001;
parameter s1 = 5'b00010;
parameter s2 = 5'b00100;
parameter s3 = 5'b01000;
parameter s4 = 5'b10000;
// Initialize current_state on reset
always @(posedge clk or posedge reset) begin
if (reset) begin
current_state <= s0; // Reset to initial state
end else begin

VDF Assignment 2 31

current_state <= next_state; // Update current state
end
end
// Combinational block for state transition and output logic
always @(*) begin
case (current_state)
s0: begin
if (fsm_input == 2'b00) begin
next_state = s0;
fsm_output = 2'b01;
end else if (fsm_input == 2'b01) begin
next_state = s0;
fsm_output = 2'b00;
end else if (fsm_input == 2'b10) begin
next_state = s1;
fsm_output = 2'b01;
end else begin
next_state = s2;
fsm_output = 2'b00;
end
end
s1: begin
if (fsm_input == 2'b00) begin
next_state = s0;
fsm_output = 2'b11;
end else if (fsm_input == 2'b10) begin
next_state = s1;
fsm_output = 2'b10;
end else if (fsm_input == 2'b01) begin
next_state = s2;
fsm_output = 2'b11;
end else begin
next_state = s3;
fsm_output = 2'b10;
end
end
s2: begin
if (fsm_input == 2'b00) begin
next_state = s0;
fsm_output = 2'b00;
end else if (fsm_input == 2'b10) begin
next_state = s2;
fsm_output = 2'b00;
end else if (fsm_input == 2'b01) begin
next_state = s4;
fsm_output = 2'b01;
end else begin
next_state = s3;
fsm_output = 2'b00;
end
end
s3: begin
if (fsm_input == 2'b00) begin
next_state = s2;
fsm_output = 2'b11;
end else if (fsm_input == 2'b10) begin
next_state = s4;
fsm_output = 2'b01;
end else if (fsm_input == 2'b01) begin
next_state = s4;
fsm_output = 2'b01;
end else begin
next_state = s4;
fsm_output = 2'b11;
end
end
s4: begin
if (fsm_input == 2'b00) begin
next_state = s4;
fsm_output = 2'b00;
end else if (fsm_input == 2'b10) begin
next_state = s0;
fsm_output = 2'b10;
end else if (fsm_input == 2'b01) begin
next_state = s0;
fsm_output = 2'b00;
end else begin
next_state = s4;
fsm_output = 2'b11;
end
end
endcase
end
endmodule
