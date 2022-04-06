# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 1
set hasByteEnable 0
set MemName present_rounds_sbbkb
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 8
set AddrRange 16
set AddrWd 4
set TrueReset 0
set IsROM 1
set ROMData { "11000000" "01010000" "01100000" "10110000" "10010000" "00000000" "10100000" "11010000" "00110000" "11100000" "11110000" "10000000" "01000000" "01110000" "00010000" "00100000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 3.254
set ClkPeriod 10
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 2
set hasByteEnable 0
set MemName present_rounds_sbcud
set CoreName ap_simcore_mem
set PortList { 1 1 1 1 1 1 1 1 }
set DataWd 8
set AddrRange 256
set AddrWd 8
set TrueReset 0
set IsROM 1
set ROMData { "11110000" "10110001" "10110100" "11100101" "11100001" "10100000" "11100100" "11110001" "10100101" "11110100" "11110101" "11100000" "10110000" "10110101" "10100001" "10100100" "01110010" "00110011" "00110110" "01100111" "01100011" "00100010" "01100110" "01110011" "00100111" "01110110" "01110111" "01100010" "00110010" "00110111" "00100011" "00100110" "01111000" "00111001" "00111100" "01101101" "01101001" "00101000" "01101100" "01111001" "00101101" "01111100" "01111101" "01101000" "00111000" "00111101" "00101001" "00101100" "11011010" "10011011" "10011110" "11001111" "11001011" "10001010" "11001110" "11011011" "10001111" "11011110" "11011111" "11001010" "10011010" "10011111" "10001011" "10001110" "11010010" "10010011" "10010110" "11000111" "11000011" "10000010" "11000110" "11010011" "10000111" "11010110" "11010111" "11000010" "10010010" "10010111" "10000011" "10000110" "01010000" "00010001" "00010100" "01000101" "01000001" "00000000" "01000100" "01010001" "00000101" "01010100" "01010101" "01000000" "00010000" "00010101" "00000001" "00000100" "11011000" "10011001" "10011100" "11001101" "11001001" "10001000" "11001100" "11011001" "10001101" "11011100" "11011101" "11001000" "10011000" "10011101" "10001001" "10001100" "11110010" "10110011" "10110110" "11100111" "11100011" "10100010" "11100110" "11110011" "10100111" "11110110" "11110111" "11100010" "10110010" "10110111" "10100011" "10100110" "01011010" "00011011" "00011110" "01001111" "01001011" "00001010" "01001110" "01011011" "00001111" "01011110" "01011111" "01001010" "00011010" "00011111" "00001011" "00001110" "11111000" "10111001" "10111100" "11101101" "11101001" "10101000" "11101100" "11111001" "10101101" "11111100" "11111101" "11101000" "10111000" "10111101" "10101001" "10101100" "11111010" "10111011" "10111110" "11101111" "11101011" "10101010" "11101110" "11111011" "10101111" "11111110" "11111111" "11101010" "10111010" "10111111" "10101011" "10101110" "11010000" "10010001" "10010100" "11000101" "11000001" "10000000" "11000100" "11010001" "10000101" "11010100" "11010101" "11000000" "10010000" "10010101" "10000001" "10000100" "01110000" "00110001" "00110100" "01100101" "01100001" "00100000" "01100100" "01110001" "00100101" "01110100" "01110101" "01100000" "00110000" "00110101" "00100001" "00100100" "01111010" "00111011" "00111110" "01101111" "01101011" "00101010" "01101110" "01111011" "00101111" "01111110" "01111111" "01101010" "00111010" "00111111" "00101011" "00101110" "01010010" "00010011" "00010110" "01000111" "01000011" "00000010" "01000110" "01010011" "00000111" "01010110" "01010111" "01000010" "00010010" "00010111" "00000011" "00000110" "01011000" "00011001" "00011100" "01001101" "01001001" "00001000" "01001100" "01011001" "00001101" "01011100" "01011101" "01001000" "00011000" "00011101" "00001001" "00001100" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 3.254
set ClkPeriod 10
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 3
set hasByteEnable 0
set MemName present_rounds_sbdEe
set CoreName ap_simcore_mem
set PortList { 1 1 1 1 1 1 1 1 }
set DataWd 8
set AddrRange 256
set AddrWd 8
set TrueReset 0
set IsROM 1
set ROMData { "00111100" "01101100" "00101101" "01111001" "01111000" "00101000" "00111001" "01111100" "01101001" "00111101" "01111101" "00111000" "00101100" "01101101" "01101000" "00101001" "10011100" "11001100" "10001101" "11011001" "11011000" "10001000" "10011001" "11011100" "11001001" "10011101" "11011101" "10011000" "10001100" "11001101" "11001000" "10001001" "00011110" "01001110" "00001111" "01011011" "01011010" "00001010" "00011011" "01011110" "01001011" "00011111" "01011111" "00011010" "00001110" "01001111" "01001010" "00001011" "10110110" "11100110" "10100111" "11110011" "11110010" "10100010" "10110011" "11110110" "11100011" "10110111" "11110111" "10110010" "10100110" "11100111" "11100010" "10100011" "10110100" "11100100" "10100101" "11110001" "11110000" "10100000" "10110001" "11110100" "11100001" "10110101" "11110101" "10110000" "10100100" "11100101" "11100000" "10100001" "00010100" "01000100" "00000101" "01010001" "01010000" "00000000" "00010001" "01010100" "01000001" "00010101" "01010101" "00010000" "00000100" "01000101" "01000000" "00000001" "00110110" "01100110" "00100111" "01110011" "01110010" "00100010" "00110011" "01110110" "01100011" "00110111" "01110111" "00110010" "00100110" "01100111" "01100010" "00100011" "10111100" "11101100" "10101101" "11111001" "11111000" "10101000" "10111001" "11111100" "11101001" "10111101" "11111101" "10111000" "10101100" "11101101" "11101000" "10101001" "10010110" "11000110" "10000111" "11010011" "11010010" "10000010" "10010011" "11010110" "11000011" "10010111" "11010111" "10010010" "10000110" "11000111" "11000010" "10000011" "00111110" "01101110" "00101111" "01111011" "01111010" "00101010" "00111011" "01111110" "01101011" "00111111" "01111111" "00111010" "00101110" "01101111" "01101010" "00101011" "10111110" "11101110" "10101111" "11111011" "11111010" "10101010" "10111011" "11111110" "11101011" "10111111" "11111111" "10111010" "10101110" "11101111" "11101010" "10101011" "00110100" "01100100" "00100101" "01110001" "01110000" "00100000" "00110001" "01110100" "01100001" "00110101" "01110101" "00110000" "00100100" "01100101" "01100000" "00100001" "00011100" "01001100" "00001101" "01011001" "01011000" "00001000" "00011001" "01011100" "01001001" "00011101" "01011101" "00011000" "00001100" "01001101" "01001000" "00001001" "10011110" "11001110" "10001111" "11011011" "11011010" "10001010" "10011011" "11011110" "11001011" "10011111" "11011111" "10011010" "10001110" "11001111" "11001010" "10001011" "10010100" "11000100" "10000101" "11010001" "11010000" "10000000" "10010001" "11010100" "11000001" "10010101" "11010101" "10010000" "10000100" "11000101" "11000000" "10000001" "00010110" "01000110" "00000111" "01010011" "01010010" "00000010" "00010011" "01010110" "01000011" "00010111" "01010111" "00010010" "00000110" "01000111" "01000010" "00000011" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 3.254
set ClkPeriod 10
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 4
set hasByteEnable 0
set MemName present_rounds_sbeOg
set CoreName ap_simcore_mem
set PortList { 1 1 1 1 1 1 1 1 }
set DataWd 8
set AddrRange 256
set AddrWd 8
set TrueReset 0
set IsROM 1
set ROMData { "00001111" "00011011" "01001011" "01011110" "00011110" "00001010" "01001110" "00011111" "01011010" "01001111" "01011111" "00001110" "00001011" "01011011" "00011010" "01001010" "00100111" "00110011" "01100011" "01110110" "00110110" "00100010" "01100110" "00110111" "01110010" "01100111" "01110111" "00100110" "00100011" "01110011" "00110010" "01100010" "10000111" "10010011" "11000011" "11010110" "10010110" "10000010" "11000110" "10010111" "11010010" "11000111" "11010111" "10000110" "10000011" "11010011" "10010010" "11000010" "10101101" "10111001" "11101001" "11111100" "10111100" "10101000" "11101100" "10111101" "11111000" "11101101" "11111101" "10101100" "10101001" "11111001" "10111000" "11101000" "00101101" "00111001" "01101001" "01111100" "00111100" "00101000" "01101100" "00111101" "01111000" "01101101" "01111101" "00101100" "00101001" "01111001" "00111000" "01101000" "00000101" "00010001" "01000001" "01010100" "00010100" "00000000" "01000100" "00010101" "01010000" "01000101" "01010101" "00000100" "00000001" "01010001" "00010000" "01000000" "10001101" "10011001" "11001001" "11011100" "10011100" "10001000" "11001100" "10011101" "11011000" "11001101" "11011101" "10001100" "10001001" "11011001" "10011000" "11001000" "00101111" "00111011" "01101011" "01111110" "00111110" "00101010" "01101110" "00111111" "01111010" "01101111" "01111111" "00101110" "00101011" "01111011" "00111010" "01101010" "10100101" "10110001" "11100001" "11110100" "10110100" "10100000" "11100100" "10110101" "11110000" "11100101" "11110101" "10100100" "10100001" "11110001" "10110000" "11100000" "10001111" "10011011" "11001011" "11011110" "10011110" "10001010" "11001110" "10011111" "11011010" "11001111" "11011111" "10001110" "10001011" "11011011" "10011010" "11001010" "10101111" "10111011" "11101011" "11111110" "10111110" "10101010" "11101110" "10111111" "11111010" "11101111" "11111111" "10101110" "10101011" "11111011" "10111010" "11101010" "00001101" "00011001" "01001001" "01011100" "00011100" "00001000" "01001100" "00011101" "01011000" "01001101" "01011101" "00001100" "00001001" "01011001" "00011000" "01001000" "00000111" "00010011" "01000011" "01010110" "00010110" "00000010" "01000110" "00010111" "01010010" "01000111" "01010111" "00000110" "00000011" "01010011" "00010010" "01000010" "10100111" "10110011" "11100011" "11110110" "10110110" "10100010" "11100110" "10110111" "11110010" "11100111" "11110111" "10100110" "10100011" "11110011" "10110010" "11100010" "00100101" "00110001" "01100001" "01110100" "00110100" "00100000" "01100100" "00110101" "01110000" "01100101" "01110101" "00100100" "00100001" "01110001" "00110000" "01100000" "10000101" "10010001" "11000001" "11010100" "10010100" "10000000" "11000100" "10010101" "11010000" "11000101" "11010101" "10000100" "10000001" "11010001" "10010000" "11000000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 3.254
set ClkPeriod 10
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 5
set hasByteEnable 0
set MemName present_rounds_sbfYi
set CoreName ap_simcore_mem
set PortList { 1 1 1 1 1 1 1 1 }
set DataWd 8
set AddrRange 256
set AddrWd 8
set TrueReset 0
set IsROM 1
set ROMData { "11000011" "11000110" "11010010" "10010111" "10000111" "10000010" "10010011" "11000111" "10010110" "11010011" "11010111" "10000011" "11000010" "11010110" "10000110" "10010010" "11001001" "11001100" "11011000" "10011101" "10001101" "10001000" "10011001" "11001101" "10011100" "11011001" "11011101" "10001001" "11001000" "11011100" "10001100" "10011000" "11100001" "11100100" "11110000" "10110101" "10100101" "10100000" "10110001" "11100101" "10110100" "11110001" "11110101" "10100001" "11100000" "11110100" "10100100" "10110000" "01101011" "01101110" "01111010" "00111111" "00101111" "00101010" "00111011" "01101111" "00111110" "01111011" "01111111" "00101011" "01101010" "01111110" "00101110" "00111010" "01001011" "01001110" "01011010" "00011111" "00001111" "00001010" "00011011" "01001111" "00011110" "01011011" "01011111" "00001011" "01001010" "01011110" "00001110" "00011010" "01000001" "01000100" "01010000" "00010101" "00000101" "00000000" "00010001" "01000101" "00010100" "01010001" "01010101" "00000001" "01000000" "01010100" "00000100" "00010000" "01100011" "01100110" "01110010" "00110111" "00100111" "00100010" "00110011" "01100111" "00110110" "01110011" "01110111" "00100011" "01100010" "01110110" "00100110" "00110010" "11001011" "11001110" "11011010" "10011111" "10001111" "10001010" "10011011" "11001111" "10011110" "11011011" "11011111" "10001011" "11001010" "11011110" "10001110" "10011010" "01101001" "01101100" "01111000" "00111101" "00101101" "00101000" "00111001" "01101101" "00111100" "01111001" "01111101" "00101001" "01101000" "01111100" "00101100" "00111000" "11100011" "11100110" "11110010" "10110111" "10100111" "10100010" "10110011" "11100111" "10110110" "11110011" "11110111" "10100011" "11100010" "11110110" "10100110" "10110010" "11101011" "11101110" "11111010" "10111111" "10101111" "10101010" "10111011" "11101111" "10111110" "11111011" "11111111" "10101011" "11101010" "11111110" "10101110" "10111010" "01000011" "01000110" "01010010" "00010111" "00000111" "00000010" "00010011" "01000111" "00010110" "01010011" "01010111" "00000011" "01000010" "01010110" "00000110" "00010010" "11000001" "11000100" "11010000" "10010101" "10000101" "10000000" "10010001" "11000101" "10010100" "11010001" "11010101" "10000001" "11000000" "11010100" "10000100" "10010000" "11101001" "11101100" "11111000" "10111101" "10101101" "10101000" "10111001" "11101101" "10111100" "11111001" "11111101" "10101001" "11101000" "11111100" "10101100" "10111000" "01001001" "01001100" "01011000" "00011101" "00001101" "00001000" "00011001" "01001101" "00011100" "01011001" "01011101" "00001001" "01001000" "01011100" "00001100" "00011000" "01100001" "01100100" "01110000" "00110101" "00100101" "00100000" "00110001" "01100101" "00110100" "01110001" "01110101" "00100001" "01100000" "01110100" "00100100" "00110000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 3.254
set ClkPeriod 10
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 8 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name plain_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_plain_V \
    op interface \
    ports { plain_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name key_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_key_V \
    op interface \
    ports { key_V { I 80 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 64 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


