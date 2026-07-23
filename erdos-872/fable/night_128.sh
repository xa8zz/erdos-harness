#!/bin/bash
cd /Users/omisverycool/erdos-harness/erdos-872/fable
./solver128 59 65 27 > val128_c.csv 2>&1
if [ "$(cut -d, -f1-3 val128_c.csv)" = "$(cut -d, -f1-3 run_59_65.csv)" ]; then
  echo VAL128_OK
else
  echo VAL128_MISMATCH; fi
./solver128 66 100 29 > run128_66up.csv 2>&1
echo MARCH_DONE
