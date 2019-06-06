#!/bin/bash

sn="remsh"
i=0
t=0
np=4
for p in 53 8080 8081 {1337..1350}
do
	if [ $i -eq 0 ]; then
		tmux new-session -s $sn -n "$p" -d "while true; do nc -nvlp $p; done"
	else
		tmux new-window -t "$sn:$i" -n "$p" "while true; do nc -nvlp $p; done"
		if [ $j -ne 0 ]; then
			tmux join-pane -v -s "$sn:$i" -t "$sn:$t"
		fi
	fi
	i=$(expr $i + 1)
	t=$(( ($i - 1) / $np * $np ))
	j=$(( $i % $np ))
done
