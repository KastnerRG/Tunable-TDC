module carry_tb
    #(parameter C_NAME = "CARRY_TEST", 
      parameter C_DELAY = 15,
      parameter C_CYCLES = 100,
      parameter C_PERIOD_NS = 10,
      parameter C_PRINT_COUNTER = 1,
      parameter C_SYNC_DEPTH = 1,
      parameter C_OUT_WIDTH = 8)
    ();
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire                CLK;                    // From cg of clock_gen.v
    wire [C_OUT_WIDTH-1:0] M_AXIS_DATA;         // From carry_i of carry.v
    wire                   M_AXIS_VALID;           // From carry_i of carry.v
    wire                   RST_OUT;                // From cg of clock_gen.v
    wire                   S_AXIS_READY;           // From carry_i of carry.v
    // End of automatics

    wire                   S_AXIS_VALID;
    wire [7:0]             S_AXIS_DATA;
    wire M_AXIS_ARESETN = ~RST_OUT;
    wire M_AXIS_ACLK = CLK;
    wire M_AXIS_READY;
    
    reg [31:0] ctr;
    
    
    always @(*) begin
        if(M_AXIS_VALID === 1) begin
            if (M_AXIS_DATA[0] != M_AXIS_DATA[C_OUT_WIDTH-1] && ~RST_OUT) begin
                $display("Error: All bits of output should match!");
                //$finish;
            end 
        end
    end

    assign S_AXIS_VALID = (ctr % 7 == 0) & ~RST_OUT;
    assign S_AXIS_DATA = ctr[7:0];

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
         .S_AXIS_READY                  (S_AXIS_READY),
         .M_AXIS_DATA                   (M_AXIS_DATA[C_OUT_WIDTH-1:0]),
         .M_AXIS_VALID                  (M_AXIS_VALID),
         // Inputs
         .S_AXIS_VALID                  (S_AXIS_VALID),
         .S_AXIS_DATA                   (S_AXIS_DATA),
         .M_AXIS_ACLK                   (M_AXIS_ACLK),
         .M_AXIS_ARESETN                (M_AXIS_ARESETN),
         .M_AXIS_READY                  (M_AXIS_READY));
    
    
endmodule

