`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 04:34:48 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    
    
    wire [31:0] enable = 'h0000000F;
    wire out;
    //reg CLK;
    
   /* initial begin
       CLK = 0;
    end
    
    always begin
        #5 CLK = ~CLK;
    end*/
    top t(enable, out);
    
    
    
endmodule
