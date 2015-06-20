My Boot2Docker — Zsh (+prezto) + Tmux inside Boot2Docker plus DockerCompose
===========================================================================

myboot2docker is my configuration for boot2docker, currently it include(s), prezto
the configuration framework for Zsh (like oh my zsh do).

Tools of the trade
------------------

  - zsh 5.0.8 + prezto (OMZ)
  - tmux 2.1
  - docker-compose 1.3.0rc2


![alt text](https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker.gif "My Boot2Docker Demo")
<a href="https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker.gif" target="_blank">Demo in Mac</a> & 
<a href="https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker-win.gif" target="_blank">Demo in PuTTY</a> &
<a href="https://github.com/wharsojo/assets/blob/master/myboot2docker/myboot2docker-win-complete.gif?raw=true" target="_blank">Complete Demo</a>

Installation
------------

My Boot2Docker will work with any recent release of Boot2Docker version: v1.6.x.

  1. Launch Boot2Docker & Login as docker:

        boot2docker up
        boot2docker ssh

  2. Clone the repository:

     * for boot2docker version 1.6.x: 

        sudo -i
        curl -L https://raw.github.com/wharsojo/myboot2docker/master/tools/install-b2d-v1.6.x.sh | sh

     * for boot2docker version 1.7.x:

        sudo -i
        curl -L https://raw.github.com/wharsojo/myboot2docker/master/tools/install.sh | sh

  3. Reboot Boot2Docker and see the difference:

        sudo reboot
        boot2docker ssh

UnInstall
---------

  type: myboot2docker_uninstall

License: MIT
------------
