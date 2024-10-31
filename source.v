// // we have states s1,s2,s3,s4,s5
// // States : {000,001,010,011,100}
module my_fsm(
input wire clk,
input wire reset,
input wire [1:0] fsm_input,
output reg [1:0] fsm_output
);
// State definitions
reg [2:0] current_state, next_state;
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
// Initialize current_state on reset
always @(posedge clk or posedge reset) begin
if (reset) begin
current_state <= s0; // Reset to initial state
end else begin
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

VDF Assignment 2 5

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

VDF Assignment 2 6

end
endcase
end
endmodule
