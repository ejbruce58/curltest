#!/bin/bash
./filepost.sh tcB-1a.in imagepaths.txt >> tcB-1.out &
./filepost.sh tcB-1b.in imagepaths.txt >> tcB-1.out &
./filepost.sh tcB-1c.in imagepaths.txt >> tcB-1.out &
./filepost.sh tcB-1d.in imagepaths.txt >> tcB-1.out &
./filepost.sh tcB-1e.in imagepaths.txt >> tcB-1.out &
wait
