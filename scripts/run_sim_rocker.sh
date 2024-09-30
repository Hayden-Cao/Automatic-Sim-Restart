#!/bin/bash

NODE1=$1
NODE2=$2

current_mod_time=$(find /sim_ws/src/nodes -type f -printf "%T@\n" | sort -n | tail -n 1)
last_mod_time="$current_mod_time"
./new_terminal.sh $NODE1 $NODE2

while true; do
    current_mod_time=$(find /sim_ws/src/nodes -type f -printf "%T@\n" | sort -n | tail -n 1)
    if (( $(echo "$current_mod_time > $last_mod_time" | bc -l) )); then
        echo "Change detected. Restarting session..."
        ./new_terminal.sh $NODE1 $NODE2
        last_mod_time="$current_mod_time"
    fi
    sleep 1
done
