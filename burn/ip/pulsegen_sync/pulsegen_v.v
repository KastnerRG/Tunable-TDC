`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2020 03:55:16 PM
// Design Name: 
// Module Name: pulsegen_v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pulsegen_v(
    input clk,
    output reg[7:0] O,
    output reg syncer
    );
    
reg[1:0] count = 2'b00;

always @(posedge clk) begin
    count <= count + 1;
    O <= (count[1] == 1'b0) ? 8'b00000000 : 8'b00000001;
    syncer <= (count == 2'b10) ? 1'b1 : 1'b0;
end
 
endmodule
