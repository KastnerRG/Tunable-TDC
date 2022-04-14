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
import gmpy2 as gmpy
import numpy as np
from datetime import datetime

class Trace:
    def __init__(self):
        pass

class EdgeTrace(Trace):
    def __init__(self, data, edge):
        
        self._trace = [int.from_bytes(sample, 'big') for sample in data]
        self.__edge = edge # True = Positive Edge, False = Negative Edge

    @property
    def edge(self):
        return self._edge

    @property
    def pop(self):
        return np.array([gmpy.popcount(sample) for sample in self._trace])

    def __str__(self):
        s = ''
        for d in self._trace:
            s = s + ('{:0256b}'.format(d))[::-1] +'\n'
        return s[:-1]

class PositiveTrace(EdgeTrace):
    def __init__(self, data):
        super().__init__(data, True)

    @property
    def first(self):
        return np.array([gmpy.bit_scan0(sample) for sample in self._trace])

    @property
    def last(self):
        return np.array([gmpy.bit_length(sample) for sample in self._trace])

class NegativeTrace(EdgeTrace):
    def __init__(self, data):
        super().__init__(data, False)

    @property
    def first(self):
        return np.array([gmpy.bit_scan1(sample) for sample in self._trace])

    @property
    def last(self):
        return np.array([gmpy.bit_length(sample) for sample in self._trace])

class CombinedTrace(Trace):
    def __init__(self, ts):
        poss = ts[1::4]
        negs = ts[3::4]

        self.__pos = PositiveTrace(poss)
        self.__neg = NegativeTrace(negs)
        super().__init__()

    @property
    def pos(self):
        return self.__pos

    @property
    def neg(self):
        return self.__neg
