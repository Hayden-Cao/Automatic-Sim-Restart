# Automatic Simulation Restart on Node Edit Scripts

**Link to Video Demo:** https://youtu.be/zE94DPURdSI

# Setup Steps:

## 1) Place a nodes and scripts folder inside your f1tenth_gym_ros folder on your local PC

The nodes folder will hold all the nodes you want to run and the scripts folder can be downloaded from this repository and placed into your f1tenth_gym_ros folder

![image](https://github.com/user-attachments/assets/09ccb62a-164f-4086-a30e-f2edfbf667f0)

## 2) Copy and Paste the configurations from the DockerFile and docker-compose.yml 

The DockerFile is essentially unchanged but has an extra package called "bc" added to the apt-get install list. This "bc" package is needed in the watch scripts that we will use later.  
The docker-compose.yml file will handle the mounting of our f1tenth_gym_ros folder to the docker container.

![image](https://github.com/user-attachments/assets/1e35ec7e-416f-4f0a-919f-c4504386f892)

## 3) Run (and Close) the Docker containers using docker compose commands

Command To Run for the First Time: docker compose up --build --detach
Command To Run After Building: docker compose up --detach
Closing Docker Containers: docker compose down

# How to Use:

## Prereqs) Open Docker Desktop and Enter the f1tenth_gym_ros folder through Bash/WSL
Example:

![image](https://github.com/user-attachments/assets/1b3893f5-2b06-459e-b0b8-c1a38289ee12)

# NOVNC to Run Simulation: 

## 1) Run the needed docker compose command to start the container

* If you are running this for the first time run:

```bash
docker compose up --build --detach
```

* If you have already run --build you can run: 
```bash
docker compose up --detach
```

Note: To close containers run: 
```bash
docker compose down
```

## 2) Enter scripts/run_sim.sh <node> 

<node> will be any node you want to run. Example of running wall_follow  

Example of Step 1 and 2:  
![image](https://github.com/user-attachments/assets/49c7cf1e-b3b7-4f11-a27a-b78e00411dd7)

## 3) Use tmux kill-session and Ctrl + C to exit when finished

![image](https://github.com/user-attachments/assets/91ed0a2f-dc96-4598-b1f6-78dd7b05fa51)

![image](https://github.com/user-attachments/assets/1b835b02-4f1d-4e89-b802-972b8557745e)

## Extra Notes)

**Make New Terminals:** Use "Ctrl + b" + "c" to create a new terminal using Tmux. This terminal will already be sourced and can run any ros2 command

![image](https://github.com/user-attachments/assets/8cc8fc1f-d42e-4829-9dbc-67b98a70ef2a)

# iGPU/NVIDIA to Run Simulation




















