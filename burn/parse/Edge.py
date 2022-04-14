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
import numpy as np
class Edge:
    def __init__(self, s, e):
        self.__s = s.strip('\n')
        self.__e = int(e)
        self.__ne = int(not (e))

    @property
    def rising(self):
        return self.__e == 0
    @property
    def falling(self):
        return self.__e == 1
    
    @property
    def first(self):
        return np.int32(self.__s.find(str(self.__e)))

    @property
    def middle(self):
        return np.int32((self.first + self.last) / 2)

    @property
    def last(self):
        return np.int32(self.__s.rfind(str(self.__ne)))

    @property
    def pop(self):
        return np.int32(self.__s.count('1'))

    @staticmethod
    def isEdge(s):
        s = s.strip('\n')
        return (s[0] != s[-1])

    @staticmethod
    def create(s):
        if(not Edge.isEdge(s)):
            raise ValueError("No edge in string")
        elif s[0] == "1":
            return Rising(s)
        elif s[0] == "0":
            return Falling(s)

    def __str__(self):
        return self.__s

class Rising(Edge):
    def __init__(self, s):
        super().__init__(s, 0)

class Falling(Edge):
    def __init__(self, s):
        super().__init__(s, 1)
