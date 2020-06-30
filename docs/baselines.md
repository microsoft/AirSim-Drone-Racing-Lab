## Baselines

### moveOnSpline
- Plan and move on a minimum jerk trajectory using ground truth poses of gates:
- Generate an AirSim settings.json file (same as the one provided in releases)
    ```shell
    $ cd baselines;
    $ python generate_settings_file.py
    ```
- Start the AirSim Neurips binary, [as explained above](#running)
- Run the code!
    ```shell
    $ python baseline_racer.py \
        --enable_viz_traj \
        --enable_viz_image_cv2 \
        --planning_baseline_type all_gates_at_once \
        --planning_and_control_api moveOnSpline \
        --level_name ZhangJiaJie_Medium \
        --race_tier 1 
    ```

Usage is:
```shell
$ python baselines/baseline_racer.py -h
usage: baseline_racer.py [-h]
    [--level_name {Soccer_Field_Easy,Soccer_Field_Medium,ZhangJiaJie_Medium,Building99_Hard,Qualifier_Tier_1,Qualifier_Tier_2,Qualifier_Tier_3,Final_Tier_1,Final_Tier_2,Final_Tier_3}]
    [--planning_baseline_type {all_gates_at_once,all_gates_one_by_one}]
    [--planning_and_control_api {moveOnSpline,moveOnSplineVelConstraints}]
    [--enable_viz_traj] [--enable_viz_image_cv2]
    [--race_tier {1,2,3}]
```
