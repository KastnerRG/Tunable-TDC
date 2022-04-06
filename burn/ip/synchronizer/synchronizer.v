`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 03:40:07 PM
// Design Name: 
// Module Name: synchronizer
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

//-----------------------------------------------------
// Design Name : dff_sync_reset
// File Name   : dff_sync_reset.v
// Function    : D flip-flop sync reset
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module dff_sync_reset (
data   , // Data Input
clk    , // Clock Input
reset  , // Reset input
q        // Q output
);
//-----------Input Ports---------------
input data, clk, reset ; 

//-----------Output Ports---------------
output q;

//------------Internal Variables--------
reg q;

//-------------Code Starts Here---------
always @ ( posedge clk)
if (~reset) begin
  q <= 1'b0;
end  else begin
  q <= data;
end

endmodule //End Of Module dff_sync_reset
