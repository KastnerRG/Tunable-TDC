#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/colindrewes/orcaplsensor/riscvonpynq/orca/lmb/HLS/orcaPLGate/orcaPLGate/.autopilot/db/a.g.bc ${1+"$@"}
