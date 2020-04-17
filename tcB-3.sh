#!/bin/bash
./filepost.sh tcB-3a.in imagepaths.txt >> tcB-3.out &
./filepost.sh tcB-3b.in imagepaths.txt >> tcB-3.out &
./filepost.sh tcB-3c.in imagepaths.txt >> tcB-3.out &
./filepost.sh tcB-3d.in imagepaths.txt >> tcB-3.out &
./filepost.sh tcB-3e.in imagepaths.txt >> tcB-3.out &
wait
