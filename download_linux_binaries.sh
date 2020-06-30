#!/bin/bash
wget -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/ADRL.zip
unzip ADRL.zip;
rm ADRL.zip;

mkdir -p /home/$USER/Documents/AirSim;
wget --directory-prefix=/home/$USER/Documents/AirSim -c https://github.com/microsoft/AirSim-Drone-Racing-Lab/releases/download/v1.0-linux/settings.json;