## Using Docker with Linux Binaries
- Prerequisites:
	- Install [docker-ce](https://docs.docker.com/install/linux/docker-ce/ubuntu/). 
	- Complete the desired [post-installation steps for linux](https://docs.docker.com/install/linux/linux-postinstall/) after installing docker.    
	At the minimum, the page tells you how torun docker without root, and other useful setup options. 
	- Install [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0)). 

- Dockerfile:   
	We provide a sample [dockerfile](docker/Dockerfile) you can modify.   
	It downloads the training and qualification binaries automatically, and installs the python client.   
	By default, it uses Ubuntu 18.04 and CUDA 10.0 with OpenGL, and is build on top of [nvidia/cudagl:10.0-devel-ubuntu18.04](https://hub.docker.com/r/nvidia/cudagl).    
	This can be changed of course, as explained in the following section. 

- Building the docker image:    
	You can use [build_docker_image.py](docker/build_docker_image.py) to build the dockerfile above (or your own custom one)    
	**Usage** (with default arguments)
	```shell
	cd docker/;
	python3 build_docker_image.py \
		--dockerfile Dockerfile \
		--base_image nvidia/cudagl:10.0-devel-ubuntu18.04 \
		-- target_image airsim_neurips:10.0-devel-ubuntu18.04
	```
- Running the docker image:
	See [docker/run_docker_image.sh](docker/run_docker_image.sh) to run the docker image:   
	**Usage**
	- for running default image, training binaries, in windowed mode:    
	    `$ ./run_docker_image.sh "" training` 
	- for running default image, training binaries, in headless mode:    
	    `$ ./run_docker_image.sh "" training headless`
	- for running a custom image in windowed mode, pass in you image name and tag:    
	    `$ ./run_docker_image.sh DOCKER_IMAGE_NAME:TAG`
	- for running a custom image in headless mode, pass in you image name and tag, followed by "headless":    
	     `$ ./run_docker_image.sh DOCKER_IMAGE_NAME:TAG headless`
