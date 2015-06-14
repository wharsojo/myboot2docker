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
<a href="https://raw.githubusercontent.com/wharsojo/assets/master/myboot2docker/myboot2docker-win.gif" target="_blank">Demo in PuTTY</a>

Installation
------------

My Boot2Docker will work with any recent release of Boot2Docker, but the minimum required
version is 1.6.0.

  1. Launch Boot2Docker & Login as docker:

        boot2docker up
        boot2docker ssh

  2. Clone the repository:

        sudo -i
        curl -L https://raw.github.com/wharsojo/myboot2docker/master/tools/install.sh | sh

  3. Reboot Boot2Docker and see the difference:

        sudo reboot
        boot2docker ssh

UnInstall
---------

  just type: sudo my_ [TAB] + [ENTER] # will return: myboot2docker_uninstall

License: MIT
------------
