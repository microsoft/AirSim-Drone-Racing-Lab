#!/bin/bash
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/AirSim-Drone-Racing-Lab.zip;
mkdir -p /home/$USER/Documents/AirSim;
unzip AirSim-Drone-Racing-Lab.zip;

cd AirSim-Drone-Racing-Lab/Content/Paks;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/Building99.pak;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/Soccer_Field.pak;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/ZhangJiaJie.pak;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/Qual_Tier_1_and_Tier_3.pak;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/Qual_Tier_2.pak;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/Final_Tier_1_and_Tier_2.pak;
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/Final_Tier_3.pak;
cd ../../../;

wget --directory-prefix=/home/$USER/Documents/AirSim -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/settings.json;
rm AirSim-Drone-Racing-Lab.zip;