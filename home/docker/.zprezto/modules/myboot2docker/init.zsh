# ------------------------------------
# My Boot2Docker alias and function
# ------------------------------------

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"

alias       dr1="drv 1science/alpine"
alias    m-cdmy="cd  $SRC/myboot2docker"
alias    m-cddk="cd  $SRC/var/lib/boot2docker"
alias m-catmybl="cat $SRC/myboot2docker/bootlocal.sh"
alias m-catdkbl="cat $SRC/var/lib/boot2docker/bootlocal.sh"
alias m-catbots="cat /opt/bootscript.sh"
alias m-vi-mybl="sudo vi $SRC/myboot2docker/bootlocal.sh"

m-cp() {
  echo Copy from latest local code to boot2docker

  SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
  MYBOOT2DOCKER=$SRC/myboot2docker
  PRJ="/Users/wharsojo/Projects"

  sudo rm $MYBOOT2DOCKER/* -rf 
  sudo cp $PRJ/myboot2docker/* $MYBOOT2DOCKER -rf

  sudo chown docker:staff $MYBOOT2DOCKER/home/docker -R
  sudo chown docker:staff $MYBOOT2DOCKER/tmp/* -R
}