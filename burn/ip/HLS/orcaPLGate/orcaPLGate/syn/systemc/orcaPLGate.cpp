// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "orcaPLGate.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic orcaPLGate::ap_const_logic_1 = sc_dt::Log_1;
const sc_lv<2> orcaPLGate::ap_ST_fsm_state1 = "1";
const sc_lv<2> orcaPLGate::ap_ST_fsm_state2 = "10";
const sc_lv<1> orcaPLGate::ap_const_lv1_0 = "0";
const sc_lv<32> orcaPLGate::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> orcaPLGate::ap_const_lv32_1 = "1";
const sc_lv<1> orcaPLGate::ap_const_lv1_1 = "1";
const sc_logic orcaPLGate::ap_const_logic_0 = sc_dt::Log_0;
const bool orcaPLGate::ap_const_boolean_1 = true;

orcaPLGate::orcaPLGate(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_phi_mux_agg_result_V_phi_fu_48_p4);
    sensitive << ( state_V );
    sensitive << ( tmp_reg_81 );
    sensitive << ( agg_result_V_reg_44 );
    sensitive << ( ap_CS_fsm_state2 );

    SC_METHOD(thread_ap_return);
    sensitive << ( ap_phi_mux_agg_result_V_phi_fu_48_p4 );
    sensitive << ( ap_CS_fsm_state2 );

    SC_METHOD(thread_pulse_V_read_read_fu_38_p2);
    sensitive << ( pulse_V );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_tmp_1_fu_63_p1);
    sensitive << ( PS_V );

    SC_METHOD(thread_tmp_fu_55_p3);
    sensitive << ( PS_V );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_CS_fsm );

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_clk.pos() );

    state_V = "0";
    ap_CS_fsm = "01";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "orcaPLGate_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, pulse_V, "(port)pulse_V");
    sc_trace(mVcdFile, PS_V, "(port)PS_V");
    sc_trace(mVcdFile, ap_return, "(port)ap_return");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, state_V, "state_V");
    sc_trace(mVcdFile, tmp_fu_55_p3, "tmp_fu_55_p3");
    sc_trace(mVcdFile, tmp_reg_81, "tmp_reg_81");
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, ap_phi_mux_agg_result_V_phi_fu_48_p4, "ap_phi_mux_agg_result_V_phi_fu_48_p4");
    sc_trace(mVcdFile, agg_result_V_reg_44, "agg_result_V_reg_44");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, pulse_V_read_read_fu_38_p2, "pulse_V_read_read_fu_38_p2");
    sc_trace(mVcdFile, tmp_1_fu_63_p1, "tmp_1_fu_63_p1");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
    mHdltvinHandle.open("orcaPLGate.hdltvin.dat");
    mHdltvoutHandle.open("orcaPLGate.hdltvout.dat");
}

orcaPLGate::~orcaPLGate() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
}

void orcaPLGate::thread_ap_clk_no_reset_() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
         esl_seteq<1,1,1>(tmp_fu_55_p3.read(), ap_const_lv1_1))) {
        agg_result_V_reg_44 = ap_const_lv1_1;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, tmp_reg_81.read()))) {
        agg_result_V_reg_44 = state_V.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, tmp_fu_55_p3.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, pulse_V_read_read_fu_38_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_63_p1.read()))) {
        state_V = ap_const_lv1_1;
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) {
        tmp_reg_81 = PS_V.read().range(1, 1);
    }
}

void orcaPLGate::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void orcaPLGate::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void orcaPLGate::thread_ap_phi_mux_agg_result_V_phi_fu_48_p4() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, tmp_reg_81.read()))) {
        ap_phi_mux_agg_result_V_phi_fu_48_p4 = state_V.read();
    } else {
        ap_phi_mux_agg_result_V_phi_fu_48_p4 = agg_result_V_reg_44.read();
    }
}

void orcaPLGate::thread_ap_return() {
    ap_return = ap_phi_mux_agg_result_V_phi_fu_48_p4.read();
}

void orcaPLGate::thread_pulse_V_read_read_fu_38_p2() {
    pulse_V_read_read_fu_38_p2 = pulse_V.read();
}

void orcaPLGate::thread_tmp_1_fu_63_p1() {
    tmp_1_fu_63_p1 = PS_V.read().range(1-1, 0);
}

void orcaPLGate::thread_tmp_fu_55_p3() {
    tmp_fu_55_p3 = PS_V.read().range(1, 1);
}

void orcaPLGate::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            ap_NS_fsm = ap_ST_fsm_state2;
            break;
        case 2 : 
            ap_NS_fsm = ap_ST_fsm_state1;
            break;
        default : 
            ap_NS_fsm = "XX";
            break;
    }
}

void orcaPLGate::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvinHandle << mComma << "{"  <<  " \"ap_rst\" :  \"" << ap_rst.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"pulse_V\" :  \"" << pulse_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"PS_V\" :  \"" << PS_V.read() << "\" ";
        mHdltvoutHandle << mComma << "{"  <<  " \"ap_return\" :  \"" << ap_return.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}

