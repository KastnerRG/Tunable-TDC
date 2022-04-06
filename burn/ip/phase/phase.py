from burn.ip import HlsCore
from pynq import Register

class PhaseShifter(HlsCore):
    bindto = ['UCSD:hlsip:phase:1.0']
    __RINCDEC_OFF = 0x10
    def __init__(self, description):
        super().__init__(description)
        self.__rincdec_reg = Register(self.mmio.base_addr + self.__RINCDEC_OFF, 32)
                                  
    def up(self):
        self.__rincdec_reg[31:0] = 1
        self._run()
        
    def down(self):
        self.__rincdec_reg[31:0] = 0
        self._run()
