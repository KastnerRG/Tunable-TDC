`include "bsg_defines.v"
module top
  #(parameter C_NAME = "CARRY_TEST"
    ,parameter C_FAMILY = `SIM_FAMILY
    ,parameter C_DELAY = 15
    ,parameter C_CYCLES = 100
    ,parameter C_PERIOD_NS = 10
    ,parameter C_DEPTH_SYNC = 2
    ,parameter C_OUT_WIDTH = 128
    ,parameter C_DEPTH_FIFO = 128
    ,parameter C_PULSE_CTR_MAX = 15)
   ();
   localparam C_PULSE_CTR_WIDTH_LP = `BSG_SAFE_CLOG2(C_PULSE_CTR_MAX+1);
   localparam C_PULSE_CTR_SEL_WIDTH_LP = `BSG_SAFE_CLOG2(C_PULSE_CTR_WIDTH_LP);
   
   wire       capture_clk;
   wire       capture_reset_o;

   wire       pulse_clk;
   wire       pulse_reset_o;

   wire [C_OUT_WIDTH-1:0] carry_o;
   wire                   carry_v_o;
   wire                   carry_ready_i;

         
   logic [C_PULSE_CTR_WIDTH_LP - 1:0] ctr_pulse_o;

   // TODO: Connect to GPIO / AXI
   logic [C_PULSE_CTR_SEL_WIDTH_LP - 1:0] pulse_sel_o;
   logic                                  pulse_sel_v_o;
   logic [31:0]                           pulse_len_o;
   logic                                  pulse_len_v_o;

   // TODO: Connect to DPI FIFO
   wire [C_OUT_WIDTH-1:0] trace_i;
   wire                   trace_v_i;
   wire                   trace_yumi_o;

   logic                                  pulse_o;
   logic                                  pulse_v;
   logic [31:0]                           pulse_ctr;


   bsg_nonsynth_clock_gen
       #(.cycle_time_p(C_PERIOD_NS)
         )
   m_clk_gen
     (.o(capture_clk));

   bsg_nonsynth_dpi_clock_gen
     #(.cycle_time_p(C_PERIOD_NS)
       )
   s_clk_gen
     (.o(pulse_clk));

   bsg_nonsynth_reset_gen 
     #(
       .num_clocks_p(1)
       ,.reset_cycles_lo_p(1)
       ,.reset_cycles_hi_p(2)
       ) 
   capture_reset_gen 
     (
      .clk_i(capture_clk)
      ,.async_reset_o(capture_reset_o)
      );

   bsg_nonsynth_reset_gen 
     #(
       .num_clocks_p(1)
       ,.reset_cycles_lo_p(1)
       ,.reset_cycles_hi_p(2)
       ) 
   pulse_reset_gen 
     (
      .clk_i(pulse_clk)
      ,.async_reset_o(pulse_reset_o)
      );

   // SENSOR:
   bsg_counter_set_down
     #(
       // Parameters
       .width_p                         (32) // For AXI-Lite
       ,.init_val_p                     ('0)
       ,.set_and_down_exclusive_p       (0))
   trace_counter
     (
      // Outputs
      .count_r_o                        (pulse_ctr)
      // Inputs
      ,.clk_i                           (pulse_clk)
      ,.reset_i                         (pulse_reset_o)
      ,.set_i                           (pulse_len_v_o)
      ,.val_i                           (pulse_len_o)
      ,.down_i                          (pulse_v)
      );
   
   assign pulse_v = pulse_len_v_o | (pulse_ctr != '0);
   
   bsg_counter_clear_up
     #(.max_val_p(C_PULSE_CTR_MAX)
       ,.init_val_p(0)
       ,.disable_overflow_warning_p(1)
       )
   pulse_generator
     (.clk_i(pulse_clk)
      ,.reset_i(capture_reset_o)
      ,.clear_i(~pulse_v)
      ,.up_i(pulse_v)
      ,.count_o(ctr_pulse_o)
      );

   assign pulse_o = ctr_pulse_o[pulse_sel_o];

   carry
     #(
       // Parameters
       .C_OUT_WIDTH                      (C_OUT_WIDTH)
       ,.C_DEPTH_SYNC                    (C_DEPTH_SYNC)
       ,.C_FAMILY                        (C_FAMILY))
   carry_i
     (
      // Outputs
      .carry_o                           (carry_o[C_OUT_WIDTH-1:0])
      ,.valid_o                          (carry_v_o)
      // Inputs
      ,.pulse_v                          (pulse_v)
      ,.pulse                            (pulse_o)
      ,.pulse_clk                        (pulse_clk)
      ,.ready_i                          (carry_ready_i)
      ,.capture_clk                      (capture_clk));

   bsg_fifo_1r1w_small
     #(
       .width_p                 (C_OUT_WIDTH)
       ,.els_p                          (1)
       ,.harden_p                       (0)
       ,.ready_THEN_valid_p             (0)
       )
   fifo_i
     (
      .ready_o                          (carry_ready_i)
      ,.v_o                              (trace_v_i)
      ,.data_o                           (trace_i)

      ,.clk_i                            (capture_clk)
      ,.reset_i                          (capture_reset_o)
      ,.v_i                              (carry_v_o)
      ,.data_i                           (carry_o)
      ,.yumi_i                           (trace_yumi_o)
      ); 

   
   
endmodule

// Local Variables:
// verilog-library-flags:("-y . -y ../basejump_stl/bsg_dataflow/ -y ../basejump_stl/bsg_misc/")
// End:
