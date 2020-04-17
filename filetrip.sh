#!/bin/bash
while read f1 f2
do
	sleep $f2
	curl -s -k -o /dev/null -w "$f1\t%{time_total}\n" -F "imagefile=@$(shuf -n 1 $2)" -H "$CURLHDR" $CURLURL &
done < $1
wait
