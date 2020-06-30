## AirSim Drone Racing Lab: Overview
<img src="https://github.com/madratman/airsim_neurips_gifs/blob/master/imgs/race.gif?raw=true" width="400"> 

ADRL is a framework for drone racing research, built on [Microsoft AirSim](https://github.com/Microsoft/Airsim).   
We used our framework to host a simulation-based drone racing competition at NeurIPS 2019, [Game of Drones](https://github.com/microsoft/AirSim-NeurIPS2019-Drone-Racing). 

Currently, ADRL allows you to focus on three core research directions pertinent to autonomous drone racing -  perception, trajectory planning and control, and head-tp-head competition with a single competitor drone. 

## Race Tiers

<img src="https://github.com/madratman/airsim_neurips_gifs/blob/master/imgs/tier_1.gif?raw=true" width="400"> <img src="https://github.com/madratman/airsim_neurips_gifs/blob/master/imgs/tier_2.gif?raw=true" width="400"> 

### Tier I: Planning Only
The participant’s drone races tête-à-tête with an opponent racer. 
Ground truth for state estimation and environment is provided via our APIs, in the form of the odometry (position and velocity) of the participant and the opponent drones, and the poses of all the gates. 
The opponent racer follows a minimum jerk trajectory via `moveOnSpline`, and goes through randomized waypoints selected in each gate's cross section. 
Hence, the opponent's trajectory varies at every run. 

### Tier II: Perception Only
In this tier, the gate poses returned by the API are corrupted with noise as shown in the GIF on the right side above, and there is no opponent drone. 
The ground truth state estimate of the participant drone is still available. 
The next gate is not always in view, but the noisy pose returned by our API help steer the participants roughly in the right direction, after which vision-based control would be necessary.

### Tier III: Planning and Perception
This tier has both noisy gate poses and an opponent racer, and is essentially a combination of Tier 1 and 2. 
