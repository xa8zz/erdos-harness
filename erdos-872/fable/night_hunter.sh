#!/bin/bash
cd /Users/omisverycool/erdos-harness/erdos-872/fable
./arena4 1000000 hunter closure > hunter_1e6.txt 2>&1
./arena4 10000000 hunter closure > hunter_1e7.txt 2>&1
./arena4 1000000 topdeg closure > topdeg_1e6.txt 2>&1
echo HUNTER_DONE
