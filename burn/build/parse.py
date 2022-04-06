#!/usr/bin/python3

import glob, os, re

source_clock = 'clk_out1_base_clkWiz_0'
dest_clock = 'clk_out2_base_clkWiz_0'
# Find Clock-To-Clock Timing Report
fcp = re.compile('From Clock:  (.*)'.format(source_clock))
tcp = re.compile('To Clock:  ({})'.format(dest_clock))
mmp = re.compile('(Max|Min) Delay Paths')
rdp = re.compile('Destination:.*rSync_reg\[0\]\[([0-9]{1,3})\]')
wrp = re.compile('wResult\[([0-9]{1,3})\]')
rtp = re.compile('routethrough/O')

arrp = re.compile('.*\d+\.\d* *(\d+\.\d*)')

fnp = re.compile('base_(\d*)_(\d*)_(\w\d*)_(\d*)_(\d*)_(\w\d)')

outfile = "parsed_output.csv"
with open(outfile, 'w') as csv:
    header  = "Launch X,Launch Y,Launch Register,Carry X,Carry Y,LUT Pin,"
    header += "Min/Max,Destination Name,Index,Arrival Time (ns)\n"
    csv.write(header)
    for f in glob.glob("*.rpt"):
        if(f == "base.rpt"):
            continue
        m = fnp.search(f)
        lx = m.group(1)
        ly = m.group(2)
        bel = m.group(3)
        cx = m.group(4)
        cy = m.group(5)
        pin = m.group(6)
        s = '{},{},{},{},{},{}'.format(lx, ly, bel, cx, cy, pin)
        with open(f, 'r') as rpt:
            matches = 0
            for l in rpt:
                foo = 'S_AXIS_TDATA[0]'

                m = fcp.search(l)
                if(m):
                    fr = (m.group(1) == source_clock)

                m = tcp.search(l)
                if(m):
                    to = (m.group(1) == dest_clock)

                m = mmp.search(l)
                if(m):
                    ty = m.group(1)

                m = rdp.search(l)
                if(m):
                    idx = m.group(1)

                m = rtp.search(l)
                if(m and fr and to and idx == '127'):
                    rtp_arr_time = arrp.search(l).group(1)
                    csv.write('{0},{1},{2},{3},{4}\n'.format(s, ty, 'routethrough', idx, rtp_arr_time))
        
                m = wrp.search(l)
                if(m and fr and to):
                    matches += 1
                    arr_time = arrp.search(l).group(1)
                    csv.write('{0},{1},{2},{3},{4}\n'.format(s, ty, 'wResult', idx, arr_time))
            print(f, matches)
