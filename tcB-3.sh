#!/bin/bash
./postimage-proc.sh 15-10-300.in imagepaths.txt >> tcB-3.out &
./postimage-proc.sh 15-5-300.in imagepaths.txt >> tcB-3.out &
./postimage-proc.sh 15-2-300.in imagepaths.txt >> tcB-3.out &
./postimage-proc.sh 15-1-300.in imagepaths.txt >> tcB-3.out &
./postimage-proc.sh 15-0.5-300.in imagepaths.txt >> tcB-3.out &
wait
