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
import os, inspect, pynq
from .magic.Magic import Magic
from pynq import Overlay

class TopOverlay(Overlay):
    """The Overlay class wraps the pynq.Overlay class with an updated
    __init__ method. The new __init__ method modifies the PYNQ Overlay
    Search Path to include the folder of the class definition.

    """
    def __get_path(self):
        """Get the directory path of this file, or the directory path of the
        class that inherits from this class.

        """
        # Get file path of the current class (i.e. /opt/python3.6/<...>/stream.py)
        file_path = os.path.abspath(inspect.getfile(inspect.getmodule(self)))
        # Get directory path of the current class (i.e. /opt/python3.6/<...>/stream/)
        return os.path.dirname(file_path)

    def __init__(self, odir, bitfile, target_bitfile=None, **kwargs):
        file_path = os.path.abspath(inspect.getfile(inspect.currentframe()))
        dir_path = os.path.dirname(file_path)
        bitfile = os.path.join(dir_path, odir, bitfile)
        if(target_bitfile != None):
            tgt = os.path.join(dir_path, odir, target_bitfile)
            print(f"Overwriting {bitfile} with {tgt}")
            shutil.copy(tgt, bitfile)
        super().__init__(bitfile, **kwargs)
