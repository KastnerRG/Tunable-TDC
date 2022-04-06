module launchpad
    #(parameter C_SYNC_DEPTH = 1)
    (input        S_AXIS_TVALID,
     input [7:0]  S_AXIS_TDATA,
     output       S_AXIS_TREADY,
     input        M_AXIS_ACLK,
     input        M_AXIS_ARESETN,
     output [7:0] M_AXIS_TDATA,
     output       M_AXIS_TVALID,
     output       M_AXIS_TLAST,
     input        M_AXIS_TREADY
     );

    (* keep = "true" *) 
    reg [7:0]       rInSyncData[C_SYNC_DEPTH-1:0];
    (* keep = "true" *) 
    reg             rInSyncValid[C_SYNC_DEPTH-1:0];
    genvar          i;
    
    always @(posedge M_AXIS_ACLK) begin
        rInSyncData[0] <= S_AXIS_TDATA;
        rInSyncValid[0] <= S_AXIS_TVALID;
    end
    assign S_AXIS_TREADY = 1;
    
    generate 
        for(i = C_SYNC_DEPTH-1 ; i > 0; i = i - 1) begin : syncgen
            always @(posedge M_AXIS_ACLK) begin
                rInSyncValid[i] <= rInSyncValid[i-1];
                rInSyncData[i] <= rInSyncData[i-1];
            end
        end
    endgenerate

    assign M_AXIS_TDATA = rInSyncData[C_SYNC_DEPTH-1];
    assign M_AXIS_TLAST = 0;
    assign M_AXIS_TVALID = rInSyncValid[C_SYNC_DEPTH-1];
endmodule
