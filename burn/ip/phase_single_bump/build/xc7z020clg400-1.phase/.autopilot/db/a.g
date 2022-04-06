#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/colin/burninator/burn/ip/phase/build/xc7z020clg400-1.phase/.autopilot/db/a.g.bc ${1+"$@"}
