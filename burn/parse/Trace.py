import gmpy2 as gmpy
import numpy as np
from datetime import datetime

class Trace:
#    _TRACE_BITS = 64
#    _TRACE_BYTES = _TRACE_BITS >> 3
    def __init__(self):
        pass
#        self._fmhz = float(fmhz)/4
#        self._inst = inst
#        self._agfi = agfi
#        self._slot = slot
#        self._time = datetime.fromtimestamp(time)
#        self._bumps = bumps
#        self._burn = burn
#        self._pol = int(pol)

    #@property
    #def fmhz(self):
    #    return (self._fmhz)

    #@property
    #def fhz(self):
    #    return (self._fmhz * 10**6)

    #def __str__(self):
    #    agfis = AGFIListing.agfi_names
    #    name = [k for k,v in agfis.items() if v == self._agfi][0]
    #    
    #    s = f'FSamp {self._fmhz:#3.2f} MHz, {self._bumps:#5d} Bumps, Burn-ID {self._burn}, Polarity {self._pol}, {self._inst}, {self._agfi} ({name:7s}), @ {self._time}'
    #    return s

class EdgeTrace(Trace):
    def __init__(self, data, edge):
        #self._trace = [int.from_bytes(sample, 'little') for sample in data]
        
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
        #ts = [data[i: i + self._TRACE_BYTES]
        #      for i in range(0, len(data), self._TRACE_BYTES)]
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

    #@classmethod
    #def factory(cls, bs, fmhz):
    #    h = bs[:bs.find(b'\x00')].decode()
    #    bs = bs[bs.find(b'\x00'):]
        #while(h):
            # A header looks like:
            # [i-03997d926ccb1c28b:agfi-098620b4c94df23bb:0:1574479312:-996:-1004:1:4194304]xx
            # [Instance ID        :AGFI        :slot:Timestamp : Sensor 0 bumps:Sensor 1 Bumps:Polarity, Trace Samples
    #    fs = h.strip('[x]').split(':')
    #    l = int(fs[-1])
    #    return CombinedTrace(fmhz, fs[0], fs[1], int(fs[2]), int(fs[3]), int(fs[4]), 0, fs[6], bs[:l])
            #bs = bs[l:]

#            ts.append(CombinedTrace(fmhz, fs[0], fs[1], int(fs[2]), int(fs[3]), int(fs[5]), 1, fs[6], bs[:l]))
#            bs = bs[l:]

            #h = bs[:bs.find(b'\x00')].decode()
            #bs = bs[bs.find(b'\x00'):]
       # return ts
