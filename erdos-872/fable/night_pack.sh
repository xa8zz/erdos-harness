#!/bin/bash
cd /Users/omisverycool/erdos-harness/erdos-872/fable
./arena5 1000000 maxdeg pack > pack_1e6.txt 2>&1
./arena5 10000000 maxdeg pack > pack_1e7.txt 2>&1
./arena5 1000000 topdeg pack > pack_td_1e6.txt 2>&1
echo PACK_DONE
