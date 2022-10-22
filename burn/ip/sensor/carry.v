module carry
  #(
    parameter C_OUT_WIDTH=1024
    ,parameter C_DEPTH_SYNC = 2
    ,parameter C_FAMILY = "7-Series")
   (
    input		     pulse_v
    ,input		     pulse
    ,input		     pulse_clk
    ,output [C_OUT_WIDTH-1:0] carry_o
    ,output		     valid_o
    // TODO: ASSERT WHEN NOT READY
    ,input		     ready_i
    ,input		     capture_clk
    );

   localparam                CARRY_WIDTH_LP = 4;


   genvar                    i;

   (* keep = "true" *)
   wire [C_OUT_WIDTH-1:0]    wInputB;
   (* keep = "true" *)
   wire [C_OUT_WIDTH-1:0]    wInputA;

   wire [C_OUT_WIDTH-1:0]    wCarryOut;

   wire [C_OUT_WIDTH/CARRY_WIDTH_LP:0]  wCascadeIn;
   wire [C_OUT_WIDTH/CARRY_WIDTH_LP-1:0]  wCascadeOut;

   (* keep = "true" *)
   wire [C_OUT_WIDTH:0]      wResult;

   (* keep = "true" *)
   reg [C_OUT_WIDTH-1:0] rSync[C_DEPTH_SYNC-1:0];

   (* keep = "true" *)
   reg                   rSyncValid[C_DEPTH_SYNC-1:0];

   wire [C_OUT_WIDTH-1:0]    wSyncEnd;

   // In the sensor, we are always ready. We have to be, to have continuous data.
   // assign S_AXIS_TREADY = 1;

   // TODO: Assert if SYNC depth is less than 2
   // assign M_AXIS_TLAST = (valid_o & !rSyncValid[C_DEPTH_SYNC-2]);
   assign valid_o = rSyncValid[C_DEPTH_SYNC-1];

   // Carry Logic:
   // All 1's, static input
   assign wInputB = {{C_OUT_WIDTH{1'b1}}};
   // All 1's, except the last bit.
   assign wInputA = {{C_OUT_WIDTH-1{1'b1}}, pulse};

   // Initial cascade in
   assign wCascadeIn[0] = 1'b0;

   generate
         for (i = 0 ; i < (C_OUT_WIDTH/CARRY_WIDTH_LP); i = i + 1) begin : carrygen
            if(C_FAMILY == "7-Series") begin : generation
               (* dont_touch = "true" *)
               CARRY4
               CARRY4_
                   (
                    .CO(wCarryOut[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry out
                    ,.O(wResult[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry chain XOR data out
                    ,.CI(wCascadeIn[i]) // 1-bit carry cascade input
                    ,.CYINIT(1'b0) // 1-bit carry initialization
                    ,.DI(wInputB[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry-MUX data in
                    ,.S(wInputA[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry-MUX select input
                    );
            end else if(C_FAMILY == "Ultrascale+") begin // block: generation
               (* dont_touch = "true" *)
               CARRY8
                 #(
                   .CARRY_TYPE("SINGLE_CY8")  // 8-bit or dual 4-bit carry (DUAL_CY4, SINGLE_CY8)
                  )
               CARRY8_inst 
                  (
                    .CO(wCarryOut[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry out
                    ,.O(wResult[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry chain XOR data out
                    ,.CI(wCascadeIn[i]) // 1-bit carry cascade input
                    ,.CI_TOP(1'b0) // 1-bit carry initialization
                    ,.DI(wInputB[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry-MUX data in
                    ,.S(wInputA[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1:CARRY_WIDTH_LP*i]) // carry-MUX select input
                  );
            end // if (C_FAMILY == "Ultrascale+")
            // Cascade from one chain to the next
            assign wCascadeOut[i] = wCarryOut[CARRY_WIDTH_LP*i+CARRY_WIDTH_LP-1];
            assign wCascadeIn[i+1] = wCascadeOut[i];
         end // block: carrygen
   endgenerate

   // Overflow bit
   assign wResult[C_OUT_WIDTH] = wCarryOut[C_OUT_WIDTH-1];

   // Synchronizer logic for data & valid
   xpm_cdc_array_single
     #(
       .DEST_SYNC_FF(C_DEPTH_SYNC),
       ,.SIM_ASSERT_CHK(1)
       ,.SRC_INPUT_REG(0)
       ,.WIDTH (C_OUT_WIDTH)
       )
   syncgen
     (
      .src_clk(pulse_clk)
      ,.src_in(wResult[C_OUT_WIDTH-1:0])
      ,.dest_clk(capture_clk)
      ,.dest_out(carry_o)
      );

   // Synchronize the valid bit
   always @(posedge capture_clk) begin
      rSyncValid[0] <= pulse_v;
   end

   generate
      for(i = C_DEPTH_SYNC-1 ; i > 0; i = i - 1) begin : syncgen_v
         always @(posedge capture_clk) begin
            rSyncValid[i] <= rSyncValid[i-1];
         end
      end
   endgenerate

endmodule
