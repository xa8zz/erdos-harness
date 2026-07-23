#!/bin/bash
cd /Users/omisverycool/erdos-harness/erdos-872/fable
./solver 59 65 26 > run_59_65.csv 2>&1
for n in 24 30 36 42 48 54 58 60 62 64 65; do
  ./solver pv $n 26 > pv$n.txt 2>&1
done
echo U64_DONE
