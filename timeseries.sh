#!/bin/bash
# $1=sources, $2=cycle time, $3=duration
#

let j=$(bc -l <<< "scale=0; $1*$3/$2")

for ((i=1;i<=j;i++))
do
  echo -e $(bc -l <<< "scale=3; $i*$2/$1")'\t'$(bc -l <<< "scale=3; $2/$1")
done
