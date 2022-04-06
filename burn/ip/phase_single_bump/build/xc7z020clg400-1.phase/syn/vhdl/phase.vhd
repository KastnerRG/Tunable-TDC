-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity phase is
generic (
    C_S_AXI_CNTRL_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_CNTRL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    psincdec_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    psen_V : OUT STD_LOGIC_VECTOR (0 downto 0);
    ps_done_V : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axi_CNTRL_AWVALID : IN STD_LOGIC;
    s_axi_CNTRL_AWREADY : OUT STD_LOGIC;
    s_axi_CNTRL_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CNTRL_ADDR_WIDTH-1 downto 0);
    s_axi_CNTRL_WVALID : IN STD_LOGIC;
    s_axi_CNTRL_WREADY : OUT STD_LOGIC;
    s_axi_CNTRL_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CNTRL_DATA_WIDTH-1 downto 0);
    s_axi_CNTRL_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CNTRL_DATA_WIDTH/8-1 downto 0);
    s_axi_CNTRL_ARVALID : IN STD_LOGIC;
    s_axi_CNTRL_ARREADY : OUT STD_LOGIC;
    s_axi_CNTRL_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CNTRL_ADDR_WIDTH-1 downto 0);
    s_axi_CNTRL_RVALID : OUT STD_LOGIC;
    s_axi_CNTRL_RREADY : IN STD_LOGIC;
    s_axi_CNTRL_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CNTRL_DATA_WIDTH-1 downto 0);
    s_axi_CNTRL_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_CNTRL_BVALID : OUT STD_LOGIC;
    s_axi_CNTRL_BREADY : IN STD_LOGIC;
    s_axi_CNTRL_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of phase is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "phase,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=6,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=84,HLS_SYN_LUT=169,HLS_VERSION=2018_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal rincdec_V : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_62_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_66 : STD_LOGIC_VECTOR (0 downto 0);
    signal psen_V_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal psincdec_V_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);

    component phase_CNTRL_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        rincdec_V : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    phase_CNTRL_s_axi_U : component phase_CNTRL_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CNTRL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CNTRL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_CNTRL_AWVALID,
        AWREADY => s_axi_CNTRL_AWREADY,
        AWADDR => s_axi_CNTRL_AWADDR,
        WVALID => s_axi_CNTRL_WVALID,
        WREADY => s_axi_CNTRL_WREADY,
        WDATA => s_axi_CNTRL_WDATA,
        WSTRB => s_axi_CNTRL_WSTRB,
        ARVALID => s_axi_CNTRL_ARVALID,
        ARREADY => s_axi_CNTRL_ARREADY,
        ARADDR => s_axi_CNTRL_ARADDR,
        RVALID => s_axi_CNTRL_RVALID,
        RREADY => s_axi_CNTRL_RREADY,
        RDATA => s_axi_CNTRL_RDATA,
        RRESP => s_axi_CNTRL_RRESP,
        BVALID => s_axi_CNTRL_BVALID,
        BREADY => s_axi_CNTRL_BREADY,
        BRESP => s_axi_CNTRL_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        rincdec_V => rincdec_V);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    psen_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                psen_V_preg <= ap_const_lv1_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    psen_V_preg <= ap_const_lv1_1;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    psen_V_preg <= ap_const_lv1_0;
                end if; 
            end if;
        end if;
    end process;


    psincdec_V_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                psincdec_V_preg <= ap_const_lv1_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    psincdec_V_preg <= tmp_reg_66;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                tmp_reg_66 <= tmp_fu_62_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);

    ap_done_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    psen_V_assign_proc : process(psen_V_preg, ap_CS_fsm_state2, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            psen_V <= ap_const_lv1_1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            psen_V <= ap_const_lv1_0;
        else 
            psen_V <= psen_V_preg;
        end if; 
    end process;


    psincdec_V_assign_proc : process(tmp_reg_66, psincdec_V_preg, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            psincdec_V <= tmp_reg_66;
        else 
            psincdec_V <= psincdec_V_preg;
        end if; 
    end process;

    tmp_fu_62_p1 <= rincdec_V(1 - 1 downto 0);
end behav;
