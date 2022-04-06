###############################################################################
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
###############################################################################
from pynq import DefaultIP
from pynq import Register

class HlsCore(DefaultIP):
    """An HLS Core driver superclass for PYNQ

    """

    # For convenince, we define register offsets that are scraped from
    # the HLS implementation header files.

    __AP_CTRL_OFF = 0x00
    __AP_CTRL_START_IDX = 0
    __AP_CTRL_DONE_IDX  = 1
    __AP_CTRL_IDLE_IDX  = 2
    __AP_CTRL_READY_IDX = 3
    __AP_CTRL_AUTORESTART_IDX = 7

    __GIE_OFF     = 0x04
    __IER_OFF     = 0x08
    __ISR_OFF     = 0x0C

    def __init__(self, description):
        super().__init__(description)

        # Define a Register object at address 0x0 of the core address space
        # We will use this to set bits and start the core (see start())
        # Do NOT write to __ap_ctrl unless ap_rstn has been deasserted

        self.__address = self.mmio.base_addr

        self.__ap_ctrl = Register(self.__address + self.__AP_CTRL_OFF, 32)
        self.__gie = Register(self.__address + self.__GIE_OFF , 32)
        self.__ier = Register(self.__address + self.__IER_OFF , 32)
        self.__isr = Register(self.__address + self.__ISR_OFF , 32)
                              
    def __set_autorestart(self):
        """ Set the autorestart bit of the HLS core
        """
        self.__ap_ctrl[self.__AP_CTRL_AUTORESTART_IDX] = 1
    
    def __clear_autorestart(self):
        """ Clear the autorestart bit
        """
        self.__ap_ctrl[self.__AP_CTRL_AUTORESTART_IDX] = 0

    def __start(self):
        """Raise AP_START and enable the HLS core

        """
        self.__ap_ctrl[self.__AP_CTRL_START_IDX] = 1

    def __stop(self):
        """Lower AP_START and disable the HLS core

        """
        self.__ap_ctrl[self.__AP_CTRL_START_IDX] = 0

    def _run(self):
        """ Run the core from start to finish
        
        """
        self.__start()
        while(not self.__ap_ctrl[self.__AP_CTRL_DONE_IDX] and
              not self.__ap_ctrl[self.__AP_CTRL_IDLE_IDX]):
            pass
        self.__stop()

    def _launch(self):
        """ Start and detatch computation on the HLS core
            
            Returns
            -------
            Nothing
            
        """
        self.__set_autorestart()
        self.__start()
        return
    
    def _land(self):
        """ Re-Connect and Terminate Computation on the HLS core
            
            Returns
            -------
            The 4-bit value representing the value of the buttons.
        
        """
        self.__clear_autorestart()
        while(not self.__ap_ctrl[self.__AP_CTRL_DONE_IDX] and
              not self.__ap_ctrl[self.__AP_CTRL_IDLE_IDX]):
            pass
        self.__stop()
    
