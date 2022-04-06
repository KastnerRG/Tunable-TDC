`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 03:01:10 PM
// Design Name: 
// Module Name: power_waster
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


module power_waster(/*input CLK,*/
    input enable,
    input c_enable,
    output reg out
    );
    
    /*initial begin
        out = 0;
    end*/
    
    //always @ (posedge CLK) begin
    always @ (*) begin
        if (c_enable) begin
            out <= ~out && enable;
        end
    end
    //assign out = ~out && enable && c_enable;
    //end


    
    
endmodule
