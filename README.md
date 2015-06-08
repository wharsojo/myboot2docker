My Boot2Docker — An Awesome Zsh inside Boot2Docker
==================================================

myboot2docker is my configuration for boot2docker, currently it include(s), prezto
the configuration framework for Zsh (like oh my zsh do).

Installation
------------

My Boot2Docker will work with any recent release of Boot2Docker, but the minimum required
version is 1.6.3.

  1. Launch Boot2Docker & Login as docker:

        boot2docker up
        boot2docker ssh

  2. Clone the repository:

        sudo -i
        curl -L https://raw.github.com/wharsojo/myboot2docker/master/tools/install.sh | sh

  3. Reboot Boot2Docker and see the difference:

        sudo reboot
        boot2docker ssh

UnInstallation
--------------

  just type: sudo my_ [TAB] + [ENTER] # will return: myboot2docker_uninstall

License: MIT
------------
