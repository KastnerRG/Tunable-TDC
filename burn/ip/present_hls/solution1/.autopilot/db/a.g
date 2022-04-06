#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/colin/burninator/burn/ip/present_hls/solution1/.autopilot/db/a.g.bc ${1+"$@"}
