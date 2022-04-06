`timescale 1ns / 1ps

module carry
    #(parameter C_OUT_WIDTH=1024, 
      parameter C_SYNC_DEPTH = 2)
    (
     input                    S_AXIS_TVALID,
     input [7:0]              S_AXIS_TDATA,
     output                   S_AXIS_TREADY,
     input                    S_AXIS_ACLK,
     input                    S_AXIS_ARESETN,
     output [C_OUT_WIDTH-1:0] M_AXIS_TDATA,
     output                   M_AXIS_TVALID,
     output                   M_AXIS_TLAST,
     input                    M_AXIS_TREADY,
     input                    M_AXIS_ACLK,
     input                    M_AXIS_ARESETN
     );

    genvar                    i;
    
    (* keep = "true" *)wire [C_OUT_WIDTH-1:0]    wInputB;
    (* keep = "true" *)wire [C_OUT_WIDTH-1:0]    wInputA;

    wire [C_OUT_WIDTH-1:0]    wCarryOut;
    wire [C_OUT_WIDTH/4-1:0]  wCascadeIn;
    wire [C_OUT_WIDTH/4-1:0]  wCascadeOut;
    (* keep = "true" *) wire [C_OUT_WIDTH:0]    wResult;

    (* keep = "true" *) reg [C_OUT_WIDTH-1:0]              rSync[C_SYNC_DEPTH-1:0];
    (* keep = "true" *) reg rSyncValid[C_SYNC_DEPTH-1:0];
    
    wire [C_OUT_WIDTH-1:0]      wSyncEnd;
    wire [C_OUT_WIDTH-1:0]      wSyncEndM1;
    always @(posedge M_AXIS_ACLK) begin
        rSync[0] <= wResult[C_OUT_WIDTH-1:0];
        rSyncValid[0] <= S_AXIS_TVALID;
    end

    generate 
        for(i = C_SYNC_DEPTH-1 ; i > 0; i = i - 1) begin : syncgen
            always @(posedge M_AXIS_ACLK) begin
                rSync[i] <= rSync[i-1];
                rSyncValid[i] <= rSyncValid[i-1];
            end
        end
    endgenerate
    assign S_AXIS_TREADY = 1;

    assign wSyncEnd = rSync[C_SYNC_DEPTH-1];
    assign wSyncEndM1 = rSync[C_SYNC_DEPTH-2];
    
    assign M_AXIS_TDATA = wSyncEnd[C_OUT_WIDTH-1:0];
    assign M_AXIS_TVALID = rSyncValid[C_SYNC_DEPTH-1];
    assign M_AXIS_TLAST = (M_AXIS_TVALID & !rSyncValid[C_SYNC_DEPTH-2]);

    assign wCascadeIn[(C_OUT_WIDTH/4)-1:0] = {wCascadeOut[(C_OUT_WIDTH/4)-2:0], 1'b0};
    assign wInputB = {{C_OUT_WIDTH{1'b1}}};
    assign wInputA = {{C_OUT_WIDTH-1{1'b1}}, S_AXIS_TDATA[0]};
 
    generate 
        for (i = 0 ; i < (C_OUT_WIDTH/4); i = i + 1) begin : carrygen
            CARRY4 
                 CARRY4_
                 (.CO(wCarryOut[4*i+4-1:4*i]), // 4-bit carry out
                  .O(wResult[4*i+4-1:4*i]), // 4-bit carry chain XOR data out
                  .CI(wCascadeIn[i]), // 1-bit carry cascade input
                  .CYINIT(1'b0), // 1-bit carry initialization
                  .DI(wInputB[4*i+4-1:4*i]), // 4-bit carry-MUX data in
                  .S(wInputA[4*i+4-1:4*i]) // 4-bit carry-MUX select input
                  );
            assign wCascadeOut[i] = wCarryOut[4*i+4-1];
        end
    endgenerate
    assign wResult[C_OUT_WIDTH] = wCarryOut[C_OUT_WIDTH-1];
    
endmodule
