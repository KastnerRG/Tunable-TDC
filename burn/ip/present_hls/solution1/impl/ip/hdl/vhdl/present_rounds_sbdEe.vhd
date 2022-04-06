-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity present_rounds_sbdEe_rom is 
    generic(
             DWIDTH     : integer := 8; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 256
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          addr1      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(DWIDTH-1 downto 0);
          addr2      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce2       : in std_logic; 
          q2         : out std_logic_vector(DWIDTH-1 downto 0);
          addr3      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce3       : in std_logic; 
          q3         : out std_logic_vector(DWIDTH-1 downto 0);
          addr4      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce4       : in std_logic; 
          q4         : out std_logic_vector(DWIDTH-1 downto 0);
          addr5      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce5       : in std_logic; 
          q5         : out std_logic_vector(DWIDTH-1 downto 0);
          addr6      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce6       : in std_logic; 
          q6         : out std_logic_vector(DWIDTH-1 downto 0);
          addr7      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce7       : in std_logic; 
          q7         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of present_rounds_sbdEe_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr2_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr3_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr4_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr5_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr6_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr7_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem0 : mem_array := (
    0 => "00111100", 1 => "01101100", 2 => "00101101", 3 => "01111001", 
    4 => "01111000", 5 => "00101000", 6 => "00111001", 7 => "01111100", 
    8 => "01101001", 9 => "00111101", 10 => "01111101", 11 => "00111000", 
    12 => "00101100", 13 => "01101101", 14 => "01101000", 15 => "00101001", 
    16 => "10011100", 17 => "11001100", 18 => "10001101", 19 => "11011001", 
    20 => "11011000", 21 => "10001000", 22 => "10011001", 23 => "11011100", 
    24 => "11001001", 25 => "10011101", 26 => "11011101", 27 => "10011000", 
    28 => "10001100", 29 => "11001101", 30 => "11001000", 31 => "10001001", 
    32 => "00011110", 33 => "01001110", 34 => "00001111", 35 => "01011011", 
    36 => "01011010", 37 => "00001010", 38 => "00011011", 39 => "01011110", 
    40 => "01001011", 41 => "00011111", 42 => "01011111", 43 => "00011010", 
    44 => "00001110", 45 => "01001111", 46 => "01001010", 47 => "00001011", 
    48 => "10110110", 49 => "11100110", 50 => "10100111", 51 => "11110011", 
    52 => "11110010", 53 => "10100010", 54 => "10110011", 55 => "11110110", 
    56 => "11100011", 57 => "10110111", 58 => "11110111", 59 => "10110010", 
    60 => "10100110", 61 => "11100111", 62 => "11100010", 63 => "10100011", 
    64 => "10110100", 65 => "11100100", 66 => "10100101", 67 => "11110001", 
    68 => "11110000", 69 => "10100000", 70 => "10110001", 71 => "11110100", 
    72 => "11100001", 73 => "10110101", 74 => "11110101", 75 => "10110000", 
    76 => "10100100", 77 => "11100101", 78 => "11100000", 79 => "10100001", 
    80 => "00010100", 81 => "01000100", 82 => "00000101", 83 => "01010001", 
    84 => "01010000", 85 => "00000000", 86 => "00010001", 87 => "01010100", 
    88 => "01000001", 89 => "00010101", 90 => "01010101", 91 => "00010000", 
    92 => "00000100", 93 => "01000101", 94 => "01000000", 95 => "00000001", 
    96 => "00110110", 97 => "01100110", 98 => "00100111", 99 => "01110011", 
    100 => "01110010", 101 => "00100010", 102 => "00110011", 103 => "01110110", 
    104 => "01100011", 105 => "00110111", 106 => "01110111", 107 => "00110010", 
    108 => "00100110", 109 => "01100111", 110 => "01100010", 111 => "00100011", 
    112 => "10111100", 113 => "11101100", 114 => "10101101", 115 => "11111001", 
    116 => "11111000", 117 => "10101000", 118 => "10111001", 119 => "11111100", 
    120 => "11101001", 121 => "10111101", 122 => "11111101", 123 => "10111000", 
    124 => "10101100", 125 => "11101101", 126 => "11101000", 127 => "10101001", 
    128 => "10010110", 129 => "11000110", 130 => "10000111", 131 => "11010011", 
    132 => "11010010", 133 => "10000010", 134 => "10010011", 135 => "11010110", 
    136 => "11000011", 137 => "10010111", 138 => "11010111", 139 => "10010010", 
    140 => "10000110", 141 => "11000111", 142 => "11000010", 143 => "10000011", 
    144 => "00111110", 145 => "01101110", 146 => "00101111", 147 => "01111011", 
    148 => "01111010", 149 => "00101010", 150 => "00111011", 151 => "01111110", 
    152 => "01101011", 153 => "00111111", 154 => "01111111", 155 => "00111010", 
    156 => "00101110", 157 => "01101111", 158 => "01101010", 159 => "00101011", 
    160 => "10111110", 161 => "11101110", 162 => "10101111", 163 => "11111011", 
    164 => "11111010", 165 => "10101010", 166 => "10111011", 167 => "11111110", 
    168 => "11101011", 169 => "10111111", 170 => "11111111", 171 => "10111010", 
    172 => "10101110", 173 => "11101111", 174 => "11101010", 175 => "10101011", 
    176 => "00110100", 177 => "01100100", 178 => "00100101", 179 => "01110001", 
    180 => "01110000", 181 => "00100000", 182 => "00110001", 183 => "01110100", 
    184 => "01100001", 185 => "00110101", 186 => "01110101", 187 => "00110000", 
    188 => "00100100", 189 => "01100101", 190 => "01100000", 191 => "00100001", 
    192 => "00011100", 193 => "01001100", 194 => "00001101", 195 => "01011001", 
    196 => "01011000", 197 => "00001000", 198 => "00011001", 199 => "01011100", 
    200 => "01001001", 201 => "00011101", 202 => "01011101", 203 => "00011000", 
    204 => "00001100", 205 => "01001101", 206 => "01001000", 207 => "00001001", 
    208 => "10011110", 209 => "11001110", 210 => "10001111", 211 => "11011011", 
    212 => "11011010", 213 => "10001010", 214 => "10011011", 215 => "11011110", 
    216 => "11001011", 217 => "10011111", 218 => "11011111", 219 => "10011010", 
    220 => "10001110", 221 => "11001111", 222 => "11001010", 223 => "10001011", 
    224 => "10010100", 225 => "11000100", 226 => "10000101", 227 => "11010001", 
    228 => "11010000", 229 => "10000000", 230 => "10010001", 231 => "11010100", 
    232 => "11000001", 233 => "10010101", 234 => "11010101", 235 => "10010000", 
    236 => "10000100", 237 => "11000101", 238 => "11000000", 239 => "10000001", 
    240 => "00010110", 241 => "01000110", 242 => "00000111", 243 => "01010011", 
    244 => "01010010", 245 => "00000010", 246 => "00010011", 247 => "01010110", 
    248 => "01000011", 249 => "00010111", 250 => "01010111", 251 => "00010010", 
    252 => "00000110", 253 => "01000111", 254 => "01000010", 255 => "00000011" );
signal mem1 : mem_array := (
    0 => "00111100", 1 => "01101100", 2 => "00101101", 3 => "01111001", 
    4 => "01111000", 5 => "00101000", 6 => "00111001", 7 => "01111100", 
    8 => "01101001", 9 => "00111101", 10 => "01111101", 11 => "00111000", 
    12 => "00101100", 13 => "01101101", 14 => "01101000", 15 => "00101001", 
    16 => "10011100", 17 => "11001100", 18 => "10001101", 19 => "11011001", 
    20 => "11011000", 21 => "10001000", 22 => "10011001", 23 => "11011100", 
    24 => "11001001", 25 => "10011101", 26 => "11011101", 27 => "10011000", 
    28 => "10001100", 29 => "11001101", 30 => "11001000", 31 => "10001001", 
    32 => "00011110", 33 => "01001110", 34 => "00001111", 35 => "01011011", 
    36 => "01011010", 37 => "00001010", 38 => "00011011", 39 => "01011110", 
    40 => "01001011", 41 => "00011111", 42 => "01011111", 43 => "00011010", 
    44 => "00001110", 45 => "01001111", 46 => "01001010", 47 => "00001011", 
    48 => "10110110", 49 => "11100110", 50 => "10100111", 51 => "11110011", 
    52 => "11110010", 53 => "10100010", 54 => "10110011", 55 => "11110110", 
    56 => "11100011", 57 => "10110111", 58 => "11110111", 59 => "10110010", 
    60 => "10100110", 61 => "11100111", 62 => "11100010", 63 => "10100011", 
    64 => "10110100", 65 => "11100100", 66 => "10100101", 67 => "11110001", 
    68 => "11110000", 69 => "10100000", 70 => "10110001", 71 => "11110100", 
    72 => "11100001", 73 => "10110101", 74 => "11110101", 75 => "10110000", 
    76 => "10100100", 77 => "11100101", 78 => "11100000", 79 => "10100001", 
    80 => "00010100", 81 => "01000100", 82 => "00000101", 83 => "01010001", 
    84 => "01010000", 85 => "00000000", 86 => "00010001", 87 => "01010100", 
    88 => "01000001", 89 => "00010101", 90 => "01010101", 91 => "00010000", 
    92 => "00000100", 93 => "01000101", 94 => "01000000", 95 => "00000001", 
    96 => "00110110", 97 => "01100110", 98 => "00100111", 99 => "01110011", 
    100 => "01110010", 101 => "00100010", 102 => "00110011", 103 => "01110110", 
    104 => "01100011", 105 => "00110111", 106 => "01110111", 107 => "00110010", 
    108 => "00100110", 109 => "01100111", 110 => "01100010", 111 => "00100011", 
    112 => "10111100", 113 => "11101100", 114 => "10101101", 115 => "11111001", 
    116 => "11111000", 117 => "10101000", 118 => "10111001", 119 => "11111100", 
    120 => "11101001", 121 => "10111101", 122 => "11111101", 123 => "10111000", 
    124 => "10101100", 125 => "11101101", 126 => "11101000", 127 => "10101001", 
    128 => "10010110", 129 => "11000110", 130 => "10000111", 131 => "11010011", 
    132 => "11010010", 133 => "10000010", 134 => "10010011", 135 => "11010110", 
    136 => "11000011", 137 => "10010111", 138 => "11010111", 139 => "10010010", 
    140 => "10000110", 141 => "11000111", 142 => "11000010", 143 => "10000011", 
    144 => "00111110", 145 => "01101110", 146 => "00101111", 147 => "01111011", 
    148 => "01111010", 149 => "00101010", 150 => "00111011", 151 => "01111110", 
    152 => "01101011", 153 => "00111111", 154 => "01111111", 155 => "00111010", 
    156 => "00101110", 157 => "01101111", 158 => "01101010", 159 => "00101011", 
    160 => "10111110", 161 => "11101110", 162 => "10101111", 163 => "11111011", 
    164 => "11111010", 165 => "10101010", 166 => "10111011", 167 => "11111110", 
    168 => "11101011", 169 => "10111111", 170 => "11111111", 171 => "10111010", 
    172 => "10101110", 173 => "11101111", 174 => "11101010", 175 => "10101011", 
    176 => "00110100", 177 => "01100100", 178 => "00100101", 179 => "01110001", 
    180 => "01110000", 181 => "00100000", 182 => "00110001", 183 => "01110100", 
    184 => "01100001", 185 => "00110101", 186 => "01110101", 187 => "00110000", 
    188 => "00100100", 189 => "01100101", 190 => "01100000", 191 => "00100001", 
    192 => "00011100", 193 => "01001100", 194 => "00001101", 195 => "01011001", 
    196 => "01011000", 197 => "00001000", 198 => "00011001", 199 => "01011100", 
    200 => "01001001", 201 => "00011101", 202 => "01011101", 203 => "00011000", 
    204 => "00001100", 205 => "01001101", 206 => "01001000", 207 => "00001001", 
    208 => "10011110", 209 => "11001110", 210 => "10001111", 211 => "11011011", 
    212 => "11011010", 213 => "10001010", 214 => "10011011", 215 => "11011110", 
    216 => "11001011", 217 => "10011111", 218 => "11011111", 219 => "10011010", 
    220 => "10001110", 221 => "11001111", 222 => "11001010", 223 => "10001011", 
    224 => "10010100", 225 => "11000100", 226 => "10000101", 227 => "11010001", 
    228 => "11010000", 229 => "10000000", 230 => "10010001", 231 => "11010100", 
    232 => "11000001", 233 => "10010101", 234 => "11010101", 235 => "10010000", 
    236 => "10000100", 237 => "11000101", 238 => "11000000", 239 => "10000001", 
    240 => "00010110", 241 => "01000110", 242 => "00000111", 243 => "01010011", 
    244 => "01010010", 245 => "00000010", 246 => "00010011", 247 => "01010110", 
    248 => "01000011", 249 => "00010111", 250 => "01010111", 251 => "00010010", 
    252 => "00000110", 253 => "01000111", 254 => "01000010", 255 => "00000011" );
signal mem2 : mem_array := (
    0 => "00111100", 1 => "01101100", 2 => "00101101", 3 => "01111001", 
    4 => "01111000", 5 => "00101000", 6 => "00111001", 7 => "01111100", 
    8 => "01101001", 9 => "00111101", 10 => "01111101", 11 => "00111000", 
    12 => "00101100", 13 => "01101101", 14 => "01101000", 15 => "00101001", 
    16 => "10011100", 17 => "11001100", 18 => "10001101", 19 => "11011001", 
    20 => "11011000", 21 => "10001000", 22 => "10011001", 23 => "11011100", 
    24 => "11001001", 25 => "10011101", 26 => "11011101", 27 => "10011000", 
    28 => "10001100", 29 => "11001101", 30 => "11001000", 31 => "10001001", 
    32 => "00011110", 33 => "01001110", 34 => "00001111", 35 => "01011011", 
    36 => "01011010", 37 => "00001010", 38 => "00011011", 39 => "01011110", 
    40 => "01001011", 41 => "00011111", 42 => "01011111", 43 => "00011010", 
    44 => "00001110", 45 => "01001111", 46 => "01001010", 47 => "00001011", 
    48 => "10110110", 49 => "11100110", 50 => "10100111", 51 => "11110011", 
    52 => "11110010", 53 => "10100010", 54 => "10110011", 55 => "11110110", 
    56 => "11100011", 57 => "10110111", 58 => "11110111", 59 => "10110010", 
    60 => "10100110", 61 => "11100111", 62 => "11100010", 63 => "10100011", 
    64 => "10110100", 65 => "11100100", 66 => "10100101", 67 => "11110001", 
    68 => "11110000", 69 => "10100000", 70 => "10110001", 71 => "11110100", 
    72 => "11100001", 73 => "10110101", 74 => "11110101", 75 => "10110000", 
    76 => "10100100", 77 => "11100101", 78 => "11100000", 79 => "10100001", 
    80 => "00010100", 81 => "01000100", 82 => "00000101", 83 => "01010001", 
    84 => "01010000", 85 => "00000000", 86 => "00010001", 87 => "01010100", 
    88 => "01000001", 89 => "00010101", 90 => "01010101", 91 => "00010000", 
    92 => "00000100", 93 => "01000101", 94 => "01000000", 95 => "00000001", 
    96 => "00110110", 97 => "01100110", 98 => "00100111", 99 => "01110011", 
    100 => "01110010", 101 => "00100010", 102 => "00110011", 103 => "01110110", 
    104 => "01100011", 105 => "00110111", 106 => "01110111", 107 => "00110010", 
    108 => "00100110", 109 => "01100111", 110 => "01100010", 111 => "00100011", 
    112 => "10111100", 113 => "11101100", 114 => "10101101", 115 => "11111001", 
    116 => "11111000", 117 => "10101000", 118 => "10111001", 119 => "11111100", 
    120 => "11101001", 121 => "10111101", 122 => "11111101", 123 => "10111000", 
    124 => "10101100", 125 => "11101101", 126 => "11101000", 127 => "10101001", 
    128 => "10010110", 129 => "11000110", 130 => "10000111", 131 => "11010011", 
    132 => "11010010", 133 => "10000010", 134 => "10010011", 135 => "11010110", 
    136 => "11000011", 137 => "10010111", 138 => "11010111", 139 => "10010010", 
    140 => "10000110", 141 => "11000111", 142 => "11000010", 143 => "10000011", 
    144 => "00111110", 145 => "01101110", 146 => "00101111", 147 => "01111011", 
    148 => "01111010", 149 => "00101010", 150 => "00111011", 151 => "01111110", 
    152 => "01101011", 153 => "00111111", 154 => "01111111", 155 => "00111010", 
    156 => "00101110", 157 => "01101111", 158 => "01101010", 159 => "00101011", 
    160 => "10111110", 161 => "11101110", 162 => "10101111", 163 => "11111011", 
    164 => "11111010", 165 => "10101010", 166 => "10111011", 167 => "11111110", 
    168 => "11101011", 169 => "10111111", 170 => "11111111", 171 => "10111010", 
    172 => "10101110", 173 => "11101111", 174 => "11101010", 175 => "10101011", 
    176 => "00110100", 177 => "01100100", 178 => "00100101", 179 => "01110001", 
    180 => "01110000", 181 => "00100000", 182 => "00110001", 183 => "01110100", 
    184 => "01100001", 185 => "00110101", 186 => "01110101", 187 => "00110000", 
    188 => "00100100", 189 => "01100101", 190 => "01100000", 191 => "00100001", 
    192 => "00011100", 193 => "01001100", 194 => "00001101", 195 => "01011001", 
    196 => "01011000", 197 => "00001000", 198 => "00011001", 199 => "01011100", 
    200 => "01001001", 201 => "00011101", 202 => "01011101", 203 => "00011000", 
    204 => "00001100", 205 => "01001101", 206 => "01001000", 207 => "00001001", 
    208 => "10011110", 209 => "11001110", 210 => "10001111", 211 => "11011011", 
    212 => "11011010", 213 => "10001010", 214 => "10011011", 215 => "11011110", 
    216 => "11001011", 217 => "10011111", 218 => "11011111", 219 => "10011010", 
    220 => "10001110", 221 => "11001111", 222 => "11001010", 223 => "10001011", 
    224 => "10010100", 225 => "11000100", 226 => "10000101", 227 => "11010001", 
    228 => "11010000", 229 => "10000000", 230 => "10010001", 231 => "11010100", 
    232 => "11000001", 233 => "10010101", 234 => "11010101", 235 => "10010000", 
    236 => "10000100", 237 => "11000101", 238 => "11000000", 239 => "10000001", 
    240 => "00010110", 241 => "01000110", 242 => "00000111", 243 => "01010011", 
    244 => "01010010", 245 => "00000010", 246 => "00010011", 247 => "01010110", 
    248 => "01000011", 249 => "00010111", 250 => "01010111", 251 => "00010010", 
    252 => "00000110", 253 => "01000111", 254 => "01000010", 255 => "00000011" );
signal mem3 : mem_array := (
    0 => "00111100", 1 => "01101100", 2 => "00101101", 3 => "01111001", 
    4 => "01111000", 5 => "00101000", 6 => "00111001", 7 => "01111100", 
    8 => "01101001", 9 => "00111101", 10 => "01111101", 11 => "00111000", 
    12 => "00101100", 13 => "01101101", 14 => "01101000", 15 => "00101001", 
    16 => "10011100", 17 => "11001100", 18 => "10001101", 19 => "11011001", 
    20 => "11011000", 21 => "10001000", 22 => "10011001", 23 => "11011100", 
    24 => "11001001", 25 => "10011101", 26 => "11011101", 27 => "10011000", 
    28 => "10001100", 29 => "11001101", 30 => "11001000", 31 => "10001001", 
    32 => "00011110", 33 => "01001110", 34 => "00001111", 35 => "01011011", 
    36 => "01011010", 37 => "00001010", 38 => "00011011", 39 => "01011110", 
    40 => "01001011", 41 => "00011111", 42 => "01011111", 43 => "00011010", 
    44 => "00001110", 45 => "01001111", 46 => "01001010", 47 => "00001011", 
    48 => "10110110", 49 => "11100110", 50 => "10100111", 51 => "11110011", 
    52 => "11110010", 53 => "10100010", 54 => "10110011", 55 => "11110110", 
    56 => "11100011", 57 => "10110111", 58 => "11110111", 59 => "10110010", 
    60 => "10100110", 61 => "11100111", 62 => "11100010", 63 => "10100011", 
    64 => "10110100", 65 => "11100100", 66 => "10100101", 67 => "11110001", 
    68 => "11110000", 69 => "10100000", 70 => "10110001", 71 => "11110100", 
    72 => "11100001", 73 => "10110101", 74 => "11110101", 75 => "10110000", 
    76 => "10100100", 77 => "11100101", 78 => "11100000", 79 => "10100001", 
    80 => "00010100", 81 => "01000100", 82 => "00000101", 83 => "01010001", 
    84 => "01010000", 85 => "00000000", 86 => "00010001", 87 => "01010100", 
    88 => "01000001", 89 => "00010101", 90 => "01010101", 91 => "00010000", 
    92 => "00000100", 93 => "01000101", 94 => "01000000", 95 => "00000001", 
    96 => "00110110", 97 => "01100110", 98 => "00100111", 99 => "01110011", 
    100 => "01110010", 101 => "00100010", 102 => "00110011", 103 => "01110110", 
    104 => "01100011", 105 => "00110111", 106 => "01110111", 107 => "00110010", 
    108 => "00100110", 109 => "01100111", 110 => "01100010", 111 => "00100011", 
    112 => "10111100", 113 => "11101100", 114 => "10101101", 115 => "11111001", 
    116 => "11111000", 117 => "10101000", 118 => "10111001", 119 => "11111100", 
    120 => "11101001", 121 => "10111101", 122 => "11111101", 123 => "10111000", 
    124 => "10101100", 125 => "11101101", 126 => "11101000", 127 => "10101001", 
    128 => "10010110", 129 => "11000110", 130 => "10000111", 131 => "11010011", 
    132 => "11010010", 133 => "10000010", 134 => "10010011", 135 => "11010110", 
    136 => "11000011", 137 => "10010111", 138 => "11010111", 139 => "10010010", 
    140 => "10000110", 141 => "11000111", 142 => "11000010", 143 => "10000011", 
    144 => "00111110", 145 => "01101110", 146 => "00101111", 147 => "01111011", 
    148 => "01111010", 149 => "00101010", 150 => "00111011", 151 => "01111110", 
    152 => "01101011", 153 => "00111111", 154 => "01111111", 155 => "00111010", 
    156 => "00101110", 157 => "01101111", 158 => "01101010", 159 => "00101011", 
    160 => "10111110", 161 => "11101110", 162 => "10101111", 163 => "11111011", 
    164 => "11111010", 165 => "10101010", 166 => "10111011", 167 => "11111110", 
    168 => "11101011", 169 => "10111111", 170 => "11111111", 171 => "10111010", 
    172 => "10101110", 173 => "11101111", 174 => "11101010", 175 => "10101011", 
    176 => "00110100", 177 => "01100100", 178 => "00100101", 179 => "01110001", 
    180 => "01110000", 181 => "00100000", 182 => "00110001", 183 => "01110100", 
    184 => "01100001", 185 => "00110101", 186 => "01110101", 187 => "00110000", 
    188 => "00100100", 189 => "01100101", 190 => "01100000", 191 => "00100001", 
    192 => "00011100", 193 => "01001100", 194 => "00001101", 195 => "01011001", 
    196 => "01011000", 197 => "00001000", 198 => "00011001", 199 => "01011100", 
    200 => "01001001", 201 => "00011101", 202 => "01011101", 203 => "00011000", 
    204 => "00001100", 205 => "01001101", 206 => "01001000", 207 => "00001001", 
    208 => "10011110", 209 => "11001110", 210 => "10001111", 211 => "11011011", 
    212 => "11011010", 213 => "10001010", 214 => "10011011", 215 => "11011110", 
    216 => "11001011", 217 => "10011111", 218 => "11011111", 219 => "10011010", 
    220 => "10001110", 221 => "11001111", 222 => "11001010", 223 => "10001011", 
    224 => "10010100", 225 => "11000100", 226 => "10000101", 227 => "11010001", 
    228 => "11010000", 229 => "10000000", 230 => "10010001", 231 => "11010100", 
    232 => "11000001", 233 => "10010101", 234 => "11010101", 235 => "10010000", 
    236 => "10000100", 237 => "11000101", 238 => "11000000", 239 => "10000001", 
    240 => "00010110", 241 => "01000110", 242 => "00000111", 243 => "01010011", 
    244 => "01010010", 245 => "00000010", 246 => "00010011", 247 => "01010110", 
    248 => "01000011", 249 => "00010111", 250 => "01010111", 251 => "00010010", 
    252 => "00000110", 253 => "01000111", 254 => "01000010", 255 => "00000011" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem0 : signal is "block_rom";
attribute syn_rom_style of mem1 : signal is "block_rom";
attribute syn_rom_style of mem2 : signal is "block_rom";
attribute syn_rom_style of mem3 : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem0 : signal is "block";
attribute ROM_STYLE of mem1 : signal is "block";
attribute ROM_STYLE of mem2 : signal is "block";
attribute ROM_STYLE of mem3 : signal is "block";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

memory_access_guard_1: process (addr1) 
begin
      addr1_tmp <= addr1;
--synthesis translate_off
      if (CONV_INTEGER(addr1) > mem_size-1) then
           addr1_tmp <= (others => '0');
      else 
           addr1_tmp <= addr1;
      end if;
--synthesis translate_on
end process;

memory_access_guard_2: process (addr2) 
begin
      addr2_tmp <= addr2;
--synthesis translate_off
      if (CONV_INTEGER(addr2) > mem_size-1) then
           addr2_tmp <= (others => '0');
      else 
           addr2_tmp <= addr2;
      end if;
--synthesis translate_on
end process;

memory_access_guard_3: process (addr3) 
begin
      addr3_tmp <= addr3;
--synthesis translate_off
      if (CONV_INTEGER(addr3) > mem_size-1) then
           addr3_tmp <= (others => '0');
      else 
           addr3_tmp <= addr3;
      end if;
--synthesis translate_on
end process;

memory_access_guard_4: process (addr4) 
begin
      addr4_tmp <= addr4;
--synthesis translate_off
      if (CONV_INTEGER(addr4) > mem_size-1) then
           addr4_tmp <= (others => '0');
      else 
           addr4_tmp <= addr4;
      end if;
--synthesis translate_on
end process;

memory_access_guard_5: process (addr5) 
begin
      addr5_tmp <= addr5;
--synthesis translate_off
      if (CONV_INTEGER(addr5) > mem_size-1) then
           addr5_tmp <= (others => '0');
      else 
           addr5_tmp <= addr5;
      end if;
--synthesis translate_on
end process;

memory_access_guard_6: process (addr6) 
begin
      addr6_tmp <= addr6;
--synthesis translate_off
      if (CONV_INTEGER(addr6) > mem_size-1) then
           addr6_tmp <= (others => '0');
      else 
           addr6_tmp <= addr6;
      end if;
--synthesis translate_on
end process;

memory_access_guard_7: process (addr7) 
begin
      addr7_tmp <= addr7;
--synthesis translate_off
      if (CONV_INTEGER(addr7) > mem_size-1) then
           addr7_tmp <= (others => '0');
      else 
           addr7_tmp <= addr7;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem0(CONV_INTEGER(addr0_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1 <= mem0(CONV_INTEGER(addr1_tmp)); 
        end if;
        if (ce2 = '1') then 
            q2 <= mem1(CONV_INTEGER(addr2_tmp)); 
        end if;
        if (ce3 = '1') then 
            q3 <= mem1(CONV_INTEGER(addr3_tmp)); 
        end if;
        if (ce4 = '1') then 
            q4 <= mem2(CONV_INTEGER(addr4_tmp)); 
        end if;
        if (ce5 = '1') then 
            q5 <= mem2(CONV_INTEGER(addr5_tmp)); 
        end if;
        if (ce6 = '1') then 
            q6 <= mem3(CONV_INTEGER(addr6_tmp)); 
        end if;
        if (ce7 = '1') then 
            q7 <= mem3(CONV_INTEGER(addr7_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity present_rounds_sbdEe is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 256;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address2 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce2 : IN STD_LOGIC;
        q2 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address3 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce3 : IN STD_LOGIC;
        q3 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address4 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce4 : IN STD_LOGIC;
        q4 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address5 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce5 : IN STD_LOGIC;
        q5 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address6 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce6 : IN STD_LOGIC;
        q6 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address7 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce7 : IN STD_LOGIC;
        q7 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of present_rounds_sbdEe is
    component present_rounds_sbdEe_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            q1 : OUT STD_LOGIC_VECTOR;
            addr2 : IN STD_LOGIC_VECTOR;
            ce2 : IN STD_LOGIC;
            q2 : OUT STD_LOGIC_VECTOR;
            addr3 : IN STD_LOGIC_VECTOR;
            ce3 : IN STD_LOGIC;
            q3 : OUT STD_LOGIC_VECTOR;
            addr4 : IN STD_LOGIC_VECTOR;
            ce4 : IN STD_LOGIC;
            q4 : OUT STD_LOGIC_VECTOR;
            addr5 : IN STD_LOGIC_VECTOR;
            ce5 : IN STD_LOGIC;
            q5 : OUT STD_LOGIC_VECTOR;
            addr6 : IN STD_LOGIC_VECTOR;
            ce6 : IN STD_LOGIC;
            q6 : OUT STD_LOGIC_VECTOR;
            addr7 : IN STD_LOGIC_VECTOR;
            ce7 : IN STD_LOGIC;
            q7 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    present_rounds_sbdEe_rom_U :  component present_rounds_sbdEe_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1,
        addr2 => address2,
        ce2 => ce2,
        q2 => q2,
        addr3 => address3,
        ce3 => ce3,
        q3 => q3,
        addr4 => address4,
        ce4 => ce4,
        q4 => q4,
        addr5 => address5,
        ce5 => ce5,
        q5 => q5,
        addr6 => address6,
        ce6 => ce6,
        q6 => q6,
        addr7 => address7,
        ce7 => ce7,
        q7 => q7);

end architecture;


