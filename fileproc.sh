#!/bin/bash
while read f1 f2
do
	sleep $f2
	curl -s -k -o /dev/null -w "$f1\t%{time_connect}\t%{time_starttransfer}\n" -F "imagefile=@$(shuf -n 1 $2)" -H "$CURLHDR" $CURLURL | awk '{print $1"\t"$3-$2}' &
done < $1
wait
