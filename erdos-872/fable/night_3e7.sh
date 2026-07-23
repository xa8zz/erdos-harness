#!/bin/bash
cd /Users/omisverycool/erdos-harness/erdos-872/fable
./arena6 30000000 maxdeg closure > closure6_3e7.txt 2>&1
./arena6 30000000 maxdeg pack > pack6_3e7.txt 2>&1
echo E37_DONE
