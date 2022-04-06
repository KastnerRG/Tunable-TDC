module testbench
    #(parameter C_NAME = "CARRY_TEST", 
      parameter C_DELAY = 15,
      parameter C_CYCLES = 100,
      parameter C_PERIOD_NS = 10,
      parameter C_PRINT_COUNTER = 1,
      parameter C_SYNC_DEPTH = 2,
      parameter C_OUT_WIDTH = 8)
    ();
    wire                CLK;                    // From cg of clock_gen.v
    wire                S_AXIS_TVALID;
    wire [7:0]          S_AXIS_TDATA;
    wire                S_AXIS_TREADY;
    wire [C_OUT_WIDTH-1:0] M_AXIS_TDATA;
    wire                   M_AXIS_TVALID;
    wire                   M_AXIS_TLAST;
    wire                   M_AXIS_TREADY;
    
    wire M_AXIS_ARESETN = ~RST_OUT;
    wire S_AXIS_ARESETN = ~RST_OUT;
    wire M_AXIS_ACLK = CLK;
    wire S_AXIS_ACLK = CLK;
    
    wire M_AXIS_READY;
    
    reg [31:0] ctr;
    
    
    always @(*) begin
        if(M_AXIS_TVALID === 1) begin
            if (M_AXIS_TDATA[0] != M_AXIS_TDATA[C_OUT_WIDTH-1] && ~RST_OUT) begin
                $display("Error: All bits of output should match!");
                //$finish;
            end 
        end
    end

    assign S_AXIS_TVALID = (ctr % 7 == 0) & ~RST_OUT;
    assign S_AXIS_TDATA = ctr[7:0];

    always @(posedge CLK)
        if(!RST_OUT)
            ctr <= ctr + 1;
        else
            ctr <= 0;
    
    clock_gen
        #(/*AUTOINSTPARAM*/
          // Parameters
          .C_NAME                       (C_NAME),
          .C_DELAY                      (C_DELAY),
          .C_PERIOD_NS                  (C_PERIOD_NS),
          .C_CYCLES                     (C_CYCLES),
          .C_PRINT_COUNTER              (C_PRINT_COUNTER))
    cg
        (/*AUTOINST*/
         // Outputs
         .CLK                           (CLK),
         .RST_OUT                       (RST_OUT));

    carry
        #(/*AUTOINSTPARAM*/
          // Parameters
          .C_OUT_WIDTH                  (C_OUT_WIDTH),
          .C_SYNC_DEPTH                 (C_SYNC_DEPTH))
    carry_i
        (/*AUTOINST*/
         // Outputs
         .S_AXIS_TREADY                 (S_AXIS_TREADY),
         .M_AXIS_TDATA                  (M_AXIS_TDATA[C_OUT_WIDTH-1:0]),
         .M_AXIS_TVALID                 (M_AXIS_TVALID),
         .M_AXIS_TLAST                  (M_AXIS_TLAST),
         // Inputs
         .S_AXIS_TVALID                 (S_AXIS_TVALID),
         .S_AXIS_TDATA                  (S_AXIS_TDATA[7:0]),
         .S_AXIS_ACLK                   (S_AXIS_ACLK),
         .S_AXIS_ARESETN                (S_AXIS_ARESETN),
         .M_AXIS_TREADY                 (M_AXIS_TREADY),
         .M_AXIS_ACLK                   (M_AXIS_ACLK),
         .M_AXIS_ARESETN                (M_AXIS_ARESETN));
    
    
endmodule

