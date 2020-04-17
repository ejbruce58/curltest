#!/bin/bash
./postimage-proc.sh 10-10-300.in imagepaths.txt >> tcB-1.out &
./postimage-proc.sh 10-5-300.in imagepaths.txt >> tcB-1.out &
./postimage-proc.sh 10-2-300.in imagepaths.txt >> tcB-1.out &
./postimage-proc.sh 10-1-300.in imagepaths.txt >> tcB-1.out &
./postimage-proc.sh 10-0.5-300.in imagepaths.txt >> tcB-1.out &
wait
