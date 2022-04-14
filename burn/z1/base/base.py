# ----------------------------------------------------------------------
# Copyright (c) 2022, The Regents of the University of California All
# rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#
#     * Neither the name of The Regents of the University of California
#       nor the names of its contributors may be used to endorse or
#       promote products derived from this software without specific
#       prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL REGENTS OF THE
# UNIVERSITY OF CALIFORNIA BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
# DAMAGE.
# ----------------------------------------------------------------------
from burn import TopOverlay
from pynq.gpio import GPIO
from pynq.xlnk import Xlnk
import numpy as np

class baseOverlay(TopOverlay.TopOverlay):
    __RESET_VALUE = 0
    __NRESET_VALUE = 1

    __FIFO_WIDTH=8

    def __init__(self, bitfile, **kwargs):
        super().__init__("z1/base", bitfile, **kwargs)
        self.chain0.resetGpio.channel1.setdirection('out')
        self.__clk1Reset = self.chain0.resetGpio.channel1[0]
        self.__clk2Reset = self.chain0.resetGpio.channel1[1]
        self.__xlnk = Xlnk()

    def _enable(self, domain):
        if(domain == 1):
            self.__clk1Reset.write(self.__NRESET_VALUE)
        elif(domain == 2):
            self.__clk2Reset.write(self.__NRESET_VALUE)
        else:
            raise RuntimeError(f"Unknown Domain {domain}. Valid " +
                               "domains are: 1, 2")

    def _disable(self, domain):
        if(domain == 1):
            self.__clk1Reset.write(self.__RESET_VALUE)
        elif(domain == 2):
            self.__clk2Reset.write(self.__RESET_VALUE)
        else:
            raise RuntimeError(f"Unknown Domain {domain}. Valid " +
                               "domains are: 1, 2")
    
    def run(self, llen):
        self._enable(1)
        self._enable(2)
        buflen = 2**(llen+1)
        buf = self.__xlnk.cma_array([buflen * self.__FIFO_WIDTH>>2], np.uint32)
        self.chain0.dataDma.recvchannel.transfer(buf)
        self.chain0.pulsegen.run(llen+1)
        self.chain0.dataDma.recvchannel.start()
        self.chain0.dataDma.recvchannel.wait()
        ret = np.reshape(buf, (buflen, self.__FIFO_WIDTH>>2))
        buf.freebuffer()

        return ret
