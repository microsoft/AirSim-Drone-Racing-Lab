## Race Monitoring

As a drone is navigating the racetrack, the race progress is streamed to a local log file, which can be found at `ADRL/Saved/Logs/RaceLogs/[TimeStamp]_[Level]_tier_[Tier#]_[Race#].log`.   
This log is updated with data such as the current odometry of the drone, number of gates passed/missed, timestamps etc.   
It may be useful to continually process this log file on the client side. The log file's data is formatted as per the following snippet:

```
A odometry_XYZRPY (75.000,-200.000,2882.102,0.000,0.000,90.000)
A gates_passed 0
A gates_missed 0
A collision_count 0
A time 8
A penalty 0
A disqualified 0
A finished 0
```

We have an [example python script](../scripts/logging/log_monitor.py) to help you analyze the log file. This script also demonstrates how one can automate starting of a new race upon the completion of a previous one, which may be useful for training scenarios.
