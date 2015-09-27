My Boot2Docker — Zsh (+prezto) + Tmux inside Boot2Docker plus DockerCompose
===========================================================================

myboot2docker is my configuration for boot2docker, currently it include(s): 
tmux, docker-compose, prezto the configuration framework for Zsh (like oh my zsh do).

Tools of the trade
------------------

  - tmux 2.1
  - docker-compose 1.4.2
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

| alias | Commands                     |  Note                                 |
|:-----:|------------------------------|---------------------------------------|
|  di   | docker images                | Get images                            |
|  dl   | docker ps -lq                | Get latest container ID               |
|  dp   | docker ps                    | Get container process                 |
|  dx   | docker exec -it              | Run specific app on running container |
|  dpa  | docker ps -a                 | Get all container process             | 
|  dpq  | docker ps -aq                | Get all numric IDs container          |
|  drd  | docker run -dP               | Run demonized                         | 
|  dri  | docker run -itP              | Run interactive                       |
|  dsr  | dkill && drm                 | Kill all running container and rm it  | 
|  drv  | docker run -itP -v           | Run and need parameter for volume     |
|  dip  | docker inspect --format ..   | Get container IP                      |
| dclean| docker rmi $(docker images ..| Remove dangling images                |
| dr-ls | curl -X GET http://localhub..| List images on private registry       |

| func   | Commands                       |  Note                              |
|:------:|--------------------------------|------------------------------------|
| dbl()  | docker build -t=$1 .;          | Dockerfile build command           |
| drm()  | docker rm $(docker ps  -aq);   | Remove all containers              |
| drmi() | docker rmi $(docker ps  -aq);  | Remove all images                  |
| drme() | ...                            | Remove all empty name images       |
| dkill()| docker kill $(docker ps  -aq); | Kill all container                 |
| dstop()| docker stop $(docker ps  -aq); | Stop all container                 |
| dr-rm()| docker curl -X DELETE http://lo| delete image from private registry |


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

pull "hello-world" from private registry:

        $ docker pull localhub:5000/hello-world

run container:

        $ docker run localhub:5000/hello-world

List all container on private registry:

        $ curl -X GET http://localhub:5000/v1/search

Delete container library from private registry:

        $ curl -X DELETE http://localhub:5000/v1/repositories/library/hello-world/

Make private registry accessible to other computer
--------------------------------------------------

Create port mapping from boot2docker to the host:

        $ VBoxManage controlvm "boot2docker-vm" natpf1 "registry,tcp,,5000,,5000";

check your ip-address (ex: 192.168.1.2).

Assume that other computer are using boot2docker and myboot2docker, update "/etc/hosts" file inside boot2docker VM to reflect your ip-address:

        $ boot2docker ssh
        $ sudo vi /etc/hosts

        192.168.1.2  localhub

        $ sudo reboot

From other computer, please try to access the private-registry, like mentioned in section "Docker Registry"

Change PORT of Running Container
--------------------------------

Switching port for Running Container, usefull if you have Java code connect to specific port and want to switch container.
Example below for PORT: 15210 switch to 2(two) different container

Command: p-map

        ~ $ p-map
        Change port of running container
        Command: p-map <container_name> <host_port:guest_port>

        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:21521 to:172.17.0.1:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:11521 to:172.17.0.2:1521

        ~ $ p-map xe1 15210:1521
        Change port of running container

        sudo iptables -t nat -A DOCKER -p tcp --dport 15210 -j DNAT --to-destination 172.17.0.1:1521

        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:21521 to:172.17.0.1:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:11521 to:172.17.0.2:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:15210 to:172.17.0.1:1521 --

        ~ $ p-map xe2 15210:1521
        Change port of running container
        Error: No such image or container: xe2

        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:21521 to:172.17.0.1:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:11521 to:172.17.0.2:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:15210 to:172.17.0.1:1521 --

        ~ $ p-map xe3 15210:1521
        Change port of running container

        sudo iptables -t nat -D DOCKER -p tcp --dport 15210 -j DNAT --to-destination 172.17.0.1:1521
        sudo iptables -t nat -A DOCKER -p tcp --dport 15210 -j DNAT --to-destination 172.17.0.2:1521

        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:21521 to:172.17.0.1:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:11521 to:172.17.0.2:1521
        DNAT     tcp  --  0.0.0.0/0       0.0.0.0/0       tcp dpt:15210 to:172.17.0.2:1521 --


License: MIT
------------
