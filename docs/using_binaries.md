## Using ADRL Binaries
### Linux
- Downloading
    - Use the [download_linux_binaries.sh](../download_linux_binaries.sh) script.
    - Python client:   
        `pip install airsimdroneracinglab`

- Running
    - Running in windowed mode:
        ```
        ./ADRL/ADRL.sh -windowed
        ```

    - Running headless (with rendering of images enabled):
        ```
        DISPLAY= ./ADRL/ADRL.sh
        ```

    - For more command line options, see [here](#command-line-options).

### Windows
- Downloading
    - Go to the [release tab](https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases).
    - Download `ADRL.zip` from the latest windows release, and unzip it.
    - Download and move the settings.json file to `~/Documents/AirSim/settings.json`.

    - Python client:   
        `pip install airsimdroneracinglab`

- Running
    - Navigate to the `ADRL/` directory, and double-click `run.bat` (or `ADRL.exe -windowed`)
    - For more command line options, see [here](#command-line-options).

## Command Line Options
The following command line options are provided by Unreal Engine, and work in Linux and Windows both.    
Here's a [complete list](https://docs.unrealengine.com/en-US/Programming/Basics/CommandLineArguments/index.html) of possible command line arguments. 

- To disable rendering completely for training planning and / or control policies, you can use:
    ```
    ./ADRL/ADRL.sh -nullrhi
    ```
    Note that `simGetImages` will not work with this option. 

- To increase speed of `simGetImages`:
    - Add `"ViewMode": "NoDisplay"` to your `~/Documents/AirSim/settings.json` file, or replace its contents with [this file](../settings/settings_no_view.json).    
    This disables rendering in the main viewport camera.   
    Then run the binary with the following options.  
    ```
    ./AirSimDroneRacingLab.sh -windowed -NoVSync -BENCHMARK
    ```
    - You can use [Unreal Engine's Stat commands](https://docs.unrealengine.com/en-US/Engine/Performance/StatCommands/index.html) `Stat FPS`, `Stat UnitGraph`, `r.VSync`, `t.maxFPS` for monitoring performance. 
