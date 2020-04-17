#!/bin/bash
./postimage-proc.sh tcB-2a.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh tcB-2b.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh tcB-2c.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh tcB-2d.in imagepaths.txt >> tcB-2.out &
./postimage-proc.sh tcB-2e.in imagepaths.txt >> tcB-2.out &
wait
