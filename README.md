My Boot2Docker — Zsh (+prezto) + Tmux inside Boot2Docker plus DockerCompose
===========================================================================

myboot2docker is my configuration for boot2docker, currently it include(s): 
tmux, docker-compose, prezto the configuration framework for Zsh (like oh my zsh do).

Tools of the trade
------------------

  - tmux 2.1
  - docker-compose 1.3.3
  - zsh 5.0.8 + prezto (OMZ)


![alt text](https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker.gif "My Boot2Docker Demo")
<a href="https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker.gif" target="_blank">Demo in Mac</a> & 
<a href="https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker-win.gif" target="_blank">Demo in PuTTY</a> &
<a href="https://github.com/wharsojo/assets/blob/master/myboot2docker/myboot2docker-win-complete.gif?raw=true" target="_blank">Complete Demo</a>

Installation
------------

My Boot2Docker will work with any recent release of Boot2Docker version:  v1.6.x, v1.7.x & v1.8.x 

  1. Launch Boot2Docker & Login as docker:

        boot2docker up
        boot2docker ssh

  2. Clone the repository:

        for boot2docker version 1.7.x & 1.8.x:
        --------------------------------------
        sudo -i
        curl -L https://raw.github.com/wharsojo/myboot2docker/master/tools/install.sh | sh

        for boot2docker version 1.6.x: 
        ------------------------------
        sudo -i
        curl -L https://raw.github.com/wharsojo/myboot2docker/b2d-v1.6.x/tools/install.sh | sh

  3. Reboot Boot2Docker and see the difference:

        sudo reboot
        boot2docker ssh

UnInstall
---------

  type: myboot2docker_uninstall

Shortcuts
---------

| alias | Commands                   |  Note                                 |
|:-----:|----------------------------|---------------------------------------|
|  di   | docker images              | Get images                            |
|  dl   | docker ps -lq              | Get latest container ID               |
|  dp   | docker ps                  | Get container process                 |
|  dx   | docker exec -it            | Run specific app on running container |
|  dpa  | docker ps -a               | Get all container process             | 
|  dpq  | docker ps -aq              | Get all numric IDs container          |
|  drd  | docker run -dP             | Run demonized                         | 
|  dri  | docker run -itP            | Run interactive                       |
|  dsr  | dstop && drm               | Stop all running container and rm it  | 
|  drv  | docker run -itP -v         | Run and need parameter for volume     |
|  dip  | docker inspect --format .. | Get container IP                      |

| func   | Commands                       |  Note                            |
|:------:|--------------------------------|----------------------------------|
| dbl()  | docker build -t=$1 .;          | Dockerfile build command         |
| drm()  | docker rm $(docker ps  -aq);   | Remove all containers            |
| drmi() | docker rmi $(docker ps  -aq);  | Remove all images                |
| drme() | ...                            | Remove all empty name images     |
| dstop()| docker stop $(docker ps  -aq); | Stop all container               | 

Docker Registry
---------------

Run registry server with data save on: /mnt/sda1/registry:

        $ boot2docker ssh
        $ sudo mkdir /mnt/sda1/registry
        $ sudo chown docker:staff /mnt/sda1/registry
        $ docker run -p 5000:5000 -v /mnt/sda1/registry:/tmp/registry -e GUNICORN_OPTS='["--preload"]' --restart=always --name=registry registry

Save container "hello-world" to private registry:

        $ docker pull hello-world
        $ docker tag  hello-world localhub:5000/hello-world
        $ docker push localhub:5000/hello-world

pull "hello-world" from private registry

        $ docker pull localhub:5000/hello-world

run container

        $ docker run localhub:5000/hello-world

List all container on private registry:

        $ curl -X GET http://localhub:5000/v1/search

Delete container library from private registry:

        $ curl -X DELETE http://localhub:5000/v1/repositories/library/hello-world        

Make your private registry accessible from other computer
---------------------------------------------------------

Create port tunelling from boot2docker to the host of your computer

        $ BoxManage controlvm "boot2docker-vm" natpf1 "registry,tcp,,5000,,5000";

assuming that other computer accessing your private registry is using boot2docker and myboot2docker, check your ip-address (ex: 192.168.1.2) & update "/etc/hosts" file boot2docker of other computer to reflect to your ip-address.

        other computer
        $ boot2docker ssh
        $ sudo vi /etc/hosts

        192.168.1.2  localhub

        $ sudo reboot

after reboot the boot2docker in other computer, you can try accessing you private-registry, like mentioned in section "Docker Registry"


License: MIT
------------
