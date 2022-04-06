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
    //input reset_in,
    output reg[7:0] O,
    output reg syncer
    );
    
reg[1:0] count = 2'b00;
//reg trigger = 1'b0;
//reg reset = 1'b0;

//always @(*) begin
//    if (reset_in == 1'b1) begin
//        trigger = 1'b1;
//    end
//end

always @(posedge clk) begin
    count <= count + 1;
    O <= (count[1] == 1'b0) ? 8'b00000000 : 8'b00000001;
    syncer <= (count == 2'b10) ? 1'b1 : 1'b0;
    //if (reset == 1'b1) begin 
    //   trigger <= 1'b0;
    //    reset <= 1'b0;
    //end
    //if (trigger == 1'b1 && count == 2'b10) begin
    //    synced_reset <= 1'b1;
    //    reset <= 1'b1;
    //end
end
 
endmodule
