`timescale 1ns / 1ps
//`include "./power_waster.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 03:16:06 PM
// Design Name: 
// Module Name: top
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


module top(input [31:0] enable, input c_enable, output /*[124:0]*/ [31:0] out);

    //wire enable = 1;
    //wire [10000:0] switches;
    power_waster pw[31:0] (/*.CLK(CLK),*/ .enable(enable),.out(out),.c_enable(c_enable));
    
    //assign out = &switches;

endmodule
