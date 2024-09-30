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

## 1) Open up any terminal and go to bash and enter your f1tenth_gym_ros directory

Example:

![image](https://github.com/user-attachments/assets/1b3893f5-2b06-459e-b0b8-c1a38289ee12)

## 


















