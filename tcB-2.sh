#!/bin/bash
./postimage-proc.sh 5-10-300.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh 5-5-300.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh 5-2-300.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh 5-1-300.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh 5-0.5-300.in imagepaths.txt >> tcB-2.out &
wait
