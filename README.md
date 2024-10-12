## Automatic Simulation Restart on Node Edit Scripts 

This will work for simulations running on both NOVNC and the iGPU/NVIDIA launch using rocker but there are slightly different steps that I explain below. 

**Link to Video Demo:** https://youtu.be/zE94DPURdSI

### Setup Steps:

## 1) Place a nodes and scripts folder inside your f1tenth_gym_ros folder on your local PC

The nodes folder will hold all the nodes you want to run and the scripts folder can be downloaded from this repository and placed into your f1tenth_gym_ros folder.  

Node: If you are on an Arm MacBook (M1/M2 MacBook) replace the run_sim.sh script contents with the run_sim_for_arm_mac.sh script contents. Everything else works the same including the Dockerfile/docker-compose.yml (Tested on my M2 MacBook Air)

![image](https://github.com/user-attachments/assets/09ccb62a-164f-4086-a30e-f2edfbf667f0)

## 2) Copy and Paste the configurations from the DockerFile and docker-compose.yml 

The DockerFile is essentially unchanged but has an extra package called "bc" added to the apt-get install list. This "bc" package is needed in the watch scripts that we will use later.  
The docker-compose.yml file will handle the mounting of our f1tenth_gym_ros folder to the docker container.

![image](https://github.com/user-attachments/assets/1e35ec7e-416f-4f0a-919f-c4504386f892)

## 3) Run (and Close) the Docker containers using docker compose commands

Command To Run for the First Time: docker compose up --build -d
Command To Run After Building: docker compose up -d
Closing Docker Containers: docker compose down

# How to Use:

## Prereqs) Open Docker Desktop and Enter the f1tenth_gym_ros folder through Bash/WSL
Example:

![image](https://github.com/user-attachments/assets/1b3893f5-2b06-459e-b0b8-c1a38289ee12)

### NOVNC to Run Simulation: 

#### 1) Run the needed docker compose command to start the container

If you are running this for the first time run to run all commands in the DockerFile and start containers:

```bash
docker compose up --build -d
```

If you have already run --build once you can run for a faster start: 
```bash
docker compose up -d
```

To close containers run: 
```bash
docker compose down
```

#### 2) Start the run_sim.sh script by running:

If the package and nodes have different names:
```bash
scripts/new_sim.sh <your_package> <your_node>
```
If the package and node name are the same you only need to enter the name once:
```bash
scripts/new_sim.sh <your_node>
```
<node> will be any node you want to run. Example of running wall_follow  

Example of Step 1 and 2:  
![image](https://github.com/user-attachments/assets/49c7cf1e-b3b7-4f11-a27a-b78e00411dd7)

After running this script you should see:

![image](https://github.com/user-attachments/assets/ea6cfedd-363b-4d47-8dbb-07c922291b72)

## 3) Open http://localhost:8080/vnc_lite.html on an internet browser

It should look like this:
![image](https://github.com/user-attachments/assets/a8749640-184a-45bb-9e26-25ab4e45054a)


#### 4) Use tmux kill-session and Ctrl + C to exit when finished

```bash
tmux kill-session
```

![image](https://github.com/user-attachments/assets/91ed0a2f-dc96-4598-b1f6-78dd7b05fa51)

![image](https://github.com/user-attachments/assets/1b835b02-4f1d-4e89-b802-972b8557745e)

#### Extra Notes)

**Make New Terminals:** Use "Ctrl + b" + "c" to create a new terminal using Tmux. This terminal will already be sourced and can run any ros2 command

![image](https://github.com/user-attachments/assets/8cc8fc1f-d42e-4829-9dbc-67b98a70ef2a)

### iGPU/NVIDIA to Run Simulation

#### 1) Run these 2 commands manually or through the setup_sim.sh script in the scripts folder:

```bash
. ~/rocker_venv/bin/activate
rocker --nvidia --x11 --volume .:/sim_ws/src/f1tenth_gym_ros --volume /mnt/c/Users/<YOUR_USER>/f1tenth_gym_ros/scripts:/sim_ws --volume /mnt/c/Users/<YOUR_USER>/f1tenth_gym_ros/nodes:/sim_ws/src/nodes -- f1tenth_gym_ros
```
<YOUR_USER> is the user on your PC
## 2) Run the run_sim.sh script by running:

if the node and package name are different enter:
```bash
./run_sim.sh <package> <node> rocker
```
If the node and package name are the same enter: 
```bash
./run_sim.sh <node> rocker
```

<node> will be any node you want to run.  

Example of running wall_follow  
![image](https://github.com/user-attachments/assets/5a7e16c9-adbb-4713-a70a-9014ccb5fef4)

After running this script you should see:  

![image](https://github.com/user-attachments/assets/ea6cfedd-363b-4d47-8dbb-07c922291b72) 

RViz2 will also open on your computer  
![image](https://github.com/user-attachments/assets/e3505176-7fb8-43f1-904a-f9ce0a8bdcdb)

## 3) Use tmux kill-session and Ctrl + C to exit when finished

```bash
tmux kill-session
```

![image](https://github.com/user-attachments/assets/91ed0a2f-dc96-4598-b1f6-78dd7b05fa51)

![image](https://github.com/user-attachments/assets/1b835b02-4f1d-4e89-b802-972b8557745e)

You can also enter exit to go back to the bash terminal:
```bash
exit
```

![image](https://github.com/user-attachments/assets/cf8eeea2-b232-4a62-ba31-6c5af01241e2)

## Extra Notes)

**Make New Terminals:** Use "Ctrl + b" + "c" to create a new terminal using Tmux. This terminal will already be sourced and can run any ros2 command

![image](https://github.com/user-attachments/assets/8cc8fc1f-d42e-4829-9dbc-67b98a70ef2a)



















