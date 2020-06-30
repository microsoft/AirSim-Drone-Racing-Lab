## API overview 
We added some new APIs (marked with &#x1F49A;) to [AirSim](https://github.com/Microsoft/Airsim) for the NeurIPS competition binaries. 

#### Loading Unreal Engine environments  
- [`simLoadLevel(level_name)`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simLoadLevel) &#x1F49A;    
Possible values for `level_name` are: 
	- `"Soccer_Field_Easy"`, `"Soccer_Field_Medium"`, `"ZhangJiaJie_Medium"`, `"Building99_Hard"` in the training binaries (`v0.3`). 
	- `"Qualification_Tier_1"`, `"Qualification_Tier_2"`, `"Qualification_Tier_3"` in the qualification binaries (`v1.0`). 
	- `"Final_Tier_1"`, `"Final_Tier_2"`, `"Final_Tier_3"` in the final round binaries (`v1.1`). 
Before trying this, please ensure you've downloaded the corresponding training (`v0.3`) / qualifier (`v1.0`) / final round (`v1.0`) binaries, [as described above](https://github.com/microsoft/AirSim-NeurIPS2019-Drone-Racing#downloading-airsimexe-and-unreal-environments)

- UI Menu
	- Press `F10` to toggle the level menu
	- Click your desired level. (Note: the UI lists all the pakfiles in the `AirSim/AirSimExe/Content/Paks` directory. Ensure you downloaded the pakfile, if you are not able to see a particular environment)

#### Race APIs:
- Start a race:
	[`simStartRace(tier=1/2/3)`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simStartRace) &#x1F49A;

- Reset race:
	[`simResetRace()`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simResetRace) &#x1F49A;

- Check if racer is disqualified:
	[`simIsRacerDisqualified()`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simIsRacerDisqualified) &#x1F49A;

- Get index of last gate passed:
	[`simGetLastGatePassed()`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simGetLastGatePassed) &#x1F49A;

- Disable generation of logfiles by race APIs:
	[`simDisableRaceLog`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simDisableRaceLog) &#x1F49A;

#### Lower level control APIs:
- FPV like Angle rate setpoint APIs: 
	- [`moveByAngleRatesThrottleAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByAngleRatesThrottleAsync) &#x1F49A;
	- [`moveByAngleRatesZAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByAngleRatesZAsync) &#x1F49A; (stabilizes altitude)

- Angle setpoint APIs:  
	- [`moveByRollPitchYawThrottleAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByRollPitchYawThrottleAsync) &#x1F49A;
	- [`moveByRollPitchYawZAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByRollPitchYawZAsync) &#x1F49A; (stabilizes altitude)

- RollPitchYawrate setpoint APIs: 
	- [`moveByRollPitchYawrateThrottleAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByRollPitchYawrateThrottleAsync) &#x1F49A;
	- [`moveByRollPitchYawrateZAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByRollPitchYawrateZAsync) &#x1F49A; (stabilizes altitude)

#### Medium level control APIs:
- Velocity setpoints
	- [`moveByVelocityAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByVelocityAsync)
	- [`moveByVelocityZAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveByVelocityZAsync) (stabilizes altitude)

- Position setpoints
	- [`moveToPosition`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveToPositionAsync)
	- [`moveOnPath`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveOnPathAsync)
	- [`moveToZAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveToZAsync)

#### High level control APIs:
- Minimum jerk trajectory planning (using [ethz-asl/mav_trajectory_generation](https://github.com/ethz-asl/mav_trajectory_generation)), and trajectory tracking (using a pure pursuit like controller minimizing position and velocity errors), with position setpoints. 
	Optionally use the `*lookahead*` parameters to start new trajectory from a point sampled `n` seconds ahead for trajectory being tracked currently. 
	- [`moveOnSplineAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveOnSplineAsync) &#x1F49A;

- Minimum jerk trajectory planning (using [ethz-asl/mav_trajectory_generation](https://github.com/ethz-asl/mav_trajectory_generation)), and trajectory tracking (using a pure pursuit like controller minimizing position and velocity errors), with position setpoints and corresponding velocity constraints. Useful for making a drone go through a gate waypoint, while obeying speed and direction constraints. 
	Optionally use the `*lookahead*` parameters to start new trajectory from a point sampled `n` seconds ahead for trajectory being tracked currently. 
	- [`moveOnSplineVelConstraintsAsync`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.moveOnSplineVelConstraintsAsync) &#x1F49A;

- Clear and stop following current trajectory. 
	- [`clearTrajectory`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.clearTrajectory) &#x1F49A;

#### Gain setter APIs:
- [`setAngleRateControllerGains`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.setAngleRateControllerGains) &#x1F49A;
- [`setAngleLevelControllerGains`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.setAngleLevelControllerGains) &#x1F49A;
- [`setVelocityControllerGains`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.setVelocityControllerGains) &#x1F49A;
- [`setPositionControllerGains`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.setPositionControllerGains) &#x1F49A;
- [`setTrajectoryTrackerGains`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.setTrajectoryTrackerGains) &#x1F49A; 

#### APIs to help generate gate detection datasets:
- Object pose setter and getter: 
	- [`simSetObjectPose`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simSetObjectPose)
	- [`simGetObjectPose`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simGetObjectPose)

- Object scale setter and getter: 
	- [`simSetObjectScale`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simSetObjectScale) &#x1F49A;
	- [`simGetObjectScale`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simGetObjectScale) &#x1F49A;

- Object segmentation ID setter and getter: 
	- [`simGetSegmentationObjectID`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simGetSegmentationObjectID)
	- [`simSetSegmentationObjectID`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simSetSegmentationObjectID)

- Listing all the objects in the scene: 
	- [`simListSceneObjects`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simListSceneObjects) &#x1F49A;

- Gate specific APIs: 
	- [`simGetNominalGateInnerDimensions`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simGetNominalGateInnerDimensions) &#x1F49A;
	- [`simGetNominalGateOuterDimensions`](https://microsoft.github.io/AirSim-NeurIPS2019-Drone-Racing/api.html#airsimneurips.client.MultirotorClient.simGetNominalGateOuterDimensions) &#x1F49A;
