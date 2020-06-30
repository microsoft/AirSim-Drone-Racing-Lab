## API overview 
We added some new APIs (marked with &#x1F49A;) to [AirSim](https://github.com/Microsoft/Airsim) for the NeurIPS competition binaries. 

#### Loading Unreal Engine environments
- [`simLoadLevel(level_name)`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simLoadLevel) &#x1F49A;    
Possible values for `level_name` are: 
	- `Soccer_Field_Easy`
	- `Soccer_Field_Medium`
	- `ZhangJiaJie_Medium`
	- `Building99_Hard` 
	- `Qualification_Tier_1`
	- `Qualification_Tier_2`
	- `Qualification_Tier_3` 
	- `Final_Tier_1`
	- `Final_Tier_2`
	- `Final_Tier_3` 

Note that any race tier can be run for any level, irrespective of the `Tier_N` suffix. (Historic note: The names along with their suffixes are ported from [Game of Drones](https://github.com/microsoft/AirSim-NeurIPS2019-Drone-Racing))

- UI Menu
	- Press `F10` to toggle the level menu
	- Click your desired level. (Note: the UI lists all the pakfiles in the `ADRL/ADRL/Content/Paks` directory.)

#### Race APIs:
- Start a race:
	[`simStartRace(tier=1/2/3)`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.simStartRace) &#x1F49A;

- Reset race:
	[`simResetRace()`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.simResetRace) &#x1F49A;

- Check if racer is disqualified:
	[`simIsRacerDisqualified()`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.simIsRacerDisqualified) &#x1F49A;

- Get index of last gate passed:
	[`simGetLastGatePassed()`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.simGetLastGatePassed) &#x1F49A;

- Disable generation of logfiles by race APIs:
	[`simDisableRaceLog`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.simDisableRaceLog) &#x1F49A;

#### Lower level control APIs:
- FPV like Angle rate setpoint APIs: 
	- [`moveByAngleRatesThrottleAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByAngleRatesThrottleAsync) &#x1F49A;
	- [`moveByAngleRatesZAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByAngleRatesZAsync) &#x1F49A; (stabilizes altitude)

- Angle setpoint APIs:  
	- [`moveByRollPitchYawThrottleAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByRollPitchYawThrottleAsync) &#x1F49A;
	- [`moveByRollPitchYawZAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByRollPitchYawZAsync) &#x1F49A; (stabilizes altitude)

- RollPitchYawrate setpoint APIs: 
	- [`moveByRollPitchYawrateThrottleAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByRollPitchYawrateThrottleAsync) &#x1F49A;
	- [`moveByRollPitchYawrateZAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByRollPitchYawrateZAsync) &#x1F49A; (stabilizes altitude)

#### Medium level control APIs:
- Velocity setpoints
	- [`moveByVelocityAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByVelocityAsync)
	- [`moveByVelocityZAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveByVelocityZAsync) (stabilizes altitude)

- Position setpoints
	- [`moveToPosition`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveToPositionAsync)
	- [`moveOnPath`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveOnPathAsync)
	- [`moveToZAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveToZAsync)

#### High level control APIs:
- Minimum jerk trajectory planning (using [ethz-asl/mav_trajectory_generation](https://github.com/ethz-asl/mav_trajectory_generation)), and trajectory tracking (using a pure pursuit like controller minimizing position and velocity errors), with position setpoints. 
	Optionally use the `*lookahead*` parameters to start new trajectory from a point sampled `n` seconds ahead for trajectory being tracked currently. 
	- [`moveOnSplineAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveOnSplineAsync) &#x1F49A;

- Minimum jerk trajectory planning (using [ethz-asl/mav_trajectory_generation](https://github.com/ethz-asl/mav_trajectory_generation)), and trajectory tracking (using a pure pursuit like controller minimizing position and velocity errors), with position setpoints and corresponding velocity constraints. Useful for making a drone go through a gate waypoint, while obeying speed and direction constraints. 
	Optionally use the `*lookahead*` parameters to start new trajectory from a point sampled `n` seconds ahead for trajectory being tracked currently. 
	- [`moveOnSplineVelConstraintsAsync`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.moveOnSplineVelConstraintsAsync) &#x1F49A;

- Clear and stop following current trajectory. 
	- [`clearTrajectory`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.clearTrajectory) &#x1F49A;

#### Gain setter APIs:
- [`setAngleRateControllerGains`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.setAngleRateControllerGains) &#x1F49A;
- [`setAngleLevelControllerGains`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.setAngleLevelControllerGains) &#x1F49A;
- [`setVelocityControllerGains`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.setVelocityControllerGains) &#x1F49A;
- [`setPositionControllerGains`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.setPositionControllerGains) &#x1F49A;
- [`setTrajectoryTrackerGains`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.MultirotorClient.setTrajectoryTrackerGains) &#x1F49A; 

#### APIs to help generate gate detection datasets:
- Object pose setter and getter: 
	- [`simSetObjectPose`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simSetObjectPose)
	- [`simGetObjectPose`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simGetObjectPose)

- Object scale setter and getter: 
	- [`simSetObjectScale`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simSetObjectScale) &#x1F49A;
	- [`simGetObjectScale`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simGetObjectScale) &#x1F49A;

- Object segmentation ID setter and getter: 
	- [`simGetSegmentationObjectID`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simGetSegmentationObjectID)
	- [`simSetSegmentationObjectID`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simSetSegmentationObjectID)

- Listing all the objects in the scene: 
	- [`simListSceneObjects`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simListSceneObjects) &#x1F49A;

- Gate specific APIs: 
	- [`simGetNominalGateInnerDimensions`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simGetNominalGateInnerDimensions) &#x1F49A;
	- [`simGetNominalGateOuterDimensions`](https://microsoft.github.io/AirSim-Drone-Racing-Lab/autoapi/airsimdroneracinglab/client/index.html#airsimdroneracinglab.client.VehicleClient.simGetNominalGateOuterDimensions) &#x1F49A;
