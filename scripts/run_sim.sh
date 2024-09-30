#!/bin/bash

NODE1=$1
NODE2=$2
ROCKER_FLAG=$3

ROCKER_FOUND=0 
for arg in "$@"; do
    if [ "$arg" == "rocker" ]; then
        ROCKER_FOUND=1 
        break
    fi
done

# if rocker_flag is empty
if [ "$ROCKER_FOUND" -eq 0 ]; then 
    echo "Launching from NOvnc"
    current_mod_time=$(find nodes -type f -printf "%T@\n" | sort -n | tail -n 1)
    last_mod_time="$current_mod_time"
    if [ $# -ne 0 ]; then
        docker exec -it f1tenth_gym_ros-sim-1 /bin/bash -c "./new_terminal.sh $NODE1 $NODE2"
    else
        docker exec -it f1tenth_gym_ros-sim-1 /bin/bash
    fi
    while true; do
        current_mod_time=$(find nodes -type f -printf "%T@\n" | sort -n | tail -n 1)
        if (( $(echo "$current_mod_time > $last_mod_time" | bc -l) )); then
            echo "Change detected. Restarting session..."
            if [ $# -ne 0 ]; then
                docker exec -it f1tenth_gym_ros-sim-1 /bin/bash -c "./new_terminal.sh $NODE1 $NODE2"
            else
                docker exec -it f1tenth_gym_ros-sim-1 /bin/bash
            fi
            last_mod_time="$current_mod_time"
        fi
        sleep 1
    done
else
    echo "Launching from Rocker"
    current_mod_time=$(find /sim_ws/src/nodes -type f -printf "%T@\n" | sort -n | tail -n 1)
    last_mod_time="$current_mod_time"
    
    if [ $# -eq 2 ]; then
        ./new_terminal.sh $NODE1 
    elif [ $# -eq 3 ]; then
        ./new_terminal.sh $NODE1 $NODE2
    else
        echo "No Node Found"
        exit 1
    fi

    while true; do
        current_mod_time=$(find /sim_ws/src/nodes -type f -printf "%T@\n" | sort -n | tail -n 1)
        if (( $(echo "$current_mod_time > $last_mod_time" | bc -l) )); then
            echo "Change detected. Restarting session..."
            if [ $# -eq 2 ]; then
                ./new_terminal.sh $NODE1 
            elif [ $# -eq 3 ]; then
                ./new_terminal.sh $NODE1 $NODE2
            else
                echo "No Node Found"
                exit 1
            fi
            last_mod_time="$current_mod_time"
        fi
        sleep 1
    done
fi




