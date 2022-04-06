//----------------------------------------------------------------------------
// This software is Copyright © 2015 The Regents of the University of 
// California. All Rights Reserved.
//
// Permission to copy, modify, and distribute this software and its 
// documentation for educational, research and non-profit purposes, without 
// fee, and without a written agreement is hereby granted, provided that the 
// above copyright notice, this paragraph and the following three paragraphs 
// appear in all copies.
//
// Permission to make commercial use of this software may be obtained by 
// contacting:
// Technology Transfer Office
// 9500 Gilman Drive, Mail Code 0910
// University of California
// La Jolla, CA 92093-0910
// (858) 534-5815
// invent@ucsd.edu
// 
// This software program and documentation are copyrighted by The Regents of 
// the University of California. The software program and documentation are 
// supplied "as is", without any accompanying services from The Regents. The 
// Regents does not warrant that the operation of the program will be 
// uninterrupted or error-free. The end-user understands that the program was 
// developed for research purposes and is advised not to rely exclusively on 
// the program for any reason.
// 
// IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO
// ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR
// CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING
// OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
// EVEN IF THE UNIVERSITY OF CALIFORNIA HAS BEEN ADVISED OF
// THE POSSIBILITY OF SUCH DAMAGE. THE UNIVERSITY OF
// CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
// THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, 
// AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATIONS TO
// PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
// MODIFICATIONS.
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			clock_gen.v
// Version:				1.00.a
// Verilog Standard:	Verilog-2001
// Description:         A simple clock generation module (for simulation)
// Author:				Dustin Richmond (@darichmond)
//-----------------------------------------------------------------------------
`timescale 100ps/1ps
module clock_gen
    #(
      parameter C_NAME = "clock_gen",
      parameter C_DELAY = 10, 
      parameter C_PERIOD_NS = 10, 
      parameter C_CYCLES = 0,
      parameter C_PRINT_COUNTER = 0
      )
    (output CLK,
     output RST_OUT
     );

    localparam C_STEP =  C_PERIOD_NS*10;

    reg     rClk;
    reg     rReset;
    reg [63:0] rCounter;
    reg [63:0] rTimeNs;
    reg [63:0] rTimeps;

    assign CLK = rClk;
    assign RST_OUT = rReset;
    initial begin
        rClk = 0;
        rReset = 1;
        for (rCounter = 0; rCounter < C_CYCLES + C_DELAY; rCounter = rCounter + 1) begin
            rTimeNs = $time/10;
            if( C_PRINT_COUNTER ) begin
                $display("%s(@%0dns)",C_NAME,rTimeNs);
            end
            rClk = #(C_STEP/2) 1;
            rClk = #(C_STEP/2) 0;
            if (rCounter == C_DELAY-1) begin
                $display("%s: Reset Deasserted", C_NAME);
                rReset = 0;
            end
        end
        $stop;
    end 

endmodule
