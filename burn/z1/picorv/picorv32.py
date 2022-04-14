# ----------------------------------------------------------------------
# Copyright (c) 2018, The Regents of the University of California All
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
from burn.Processor import BramProcessor
from pynq.xlnk import Xlnk
from pynq.gpio import GPIO
import numpy as np
import os
import inspect

class baseOverlay(TopOverlay.TopOverlay):
    __RESET_VALUE = 0
    __NRESET_VALUE = 1

    __FIFO_WIDTH=8

    def __init__(self, bitfile, **kwargs):
        super().__init__("z1/picorv", bitfile, **kwargs)
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


class Processor(BramProcessor):
    """Hierarchy driver for the PicoRV32 BRAM Processor

    Note
    ----
    In order to be recognized as a RISC-V Processor hierarchy, three
    conditions must be met: First, there must be a PS-Memory-Mapped
    Block RAM Controller where the name matches the variable
    _bram. Second, the hierarchy name (fullpath) must equal the
    variable _name. Finally, there must be a GPIO port with the name
    _reset_name.

    Subclasses of this module are responsible for setting _name (The
    name of the Hierarchy), _bits (Processor bit-width), _proc
    (Processor Type Name)

    This class must be placed in a known location relative to the
    build files for this processor. The relative path can be modified
    in __get_path.

    """
    _name = 'processor'
    _proc = 'picorv32'
    _bits = 32

    @classmethod
    def checkhierarchy(cls, description):
        return super().checkhierarchy(description)

    def __get_path(self):
        """Get the directory path of this file, or the directory path of the
        class that inherits from this class.

        """
        # Get file path of the current class (i.e. /opt/python3.6/<...>/stream.py)
        file_path = "/home/xilinx/jupyter_notebooks/PL-Sensors/burn/z1/picorv/build"
        #file_path = os.path.abspath(inspect.getfile(inspect.getmodule(self)))
        # Get directory path of the current class (i.e. /opt/python3.6/<...>/stream/)
        return os.path.dirname(file_path)

    def __init__(self, description, *args):
        print("inited pico")
        """Return a new Processor object. 

        Parameters
        ----------
        description : dict
            Dictionary describing this processor.

        """
        build_path = os.path.join(self.__get_path(), "build")
        reset_value = 0
        super().__init__(build_path, reset_value, description, *args)
