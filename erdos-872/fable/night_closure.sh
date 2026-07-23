#!/bin/bash
cd /Users/omisverycool/erdos-harness/erdos-872/fable
./arena3 1000000 maxdeg closure > closure_1e6.txt 2>&1
./arena3 10000000 maxdeg closure > closure_1e7.txt 2>&1
./arena3 1000000 smallest closure > closure_sm_1e6.txt 2>&1
echo CLOSURE_DONE
