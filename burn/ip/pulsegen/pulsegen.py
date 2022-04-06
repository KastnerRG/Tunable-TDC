from burn.ip import HlsCore
from pynq import Register
class PulseGenDriver(HlsCore):
    bindto = ['UCSD:hlsip:pulsegen:1.0']
    __DURATION_OFF = 0x10
    def __init__(self, description):
        super().__init__(description)
        self.__duration_reg = Register(self.mmio.base_addr + self.__DURATION_OFF, 32)

    def run(self, llen):
        self.__duration_reg[4:0] = llen
        self._run()
