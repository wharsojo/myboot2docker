set -e

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker

C0="\033[0m"
C1="\033[0;33m"
C2="\033[0;32m"
C3="\033[0;34m"
if [ -d "$MYBOOT2DOCKER" ]; then
  echo -e "${C1}You already have My Boot2Docker installed. \nYou'll need to remove $MYBOOT2DOCKER if you want to install${C0}"
  exit
fi

echo -e "${C3}Cloning My Boot2Docker...${C0}"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/wharsojo/myboot2docker.git $MYBOOT2DOCKER || {
  echo -e "git not installed"
  exit
}
chown docker:staff $MYBOOT2DOCKER/home/docker -R
chown docker:staff $MYBOOT2DOCKER/tmp/* -R

BOOTLOCAL=$SRC/var/lib/boot2docker/bootlocal.sh
if [ ! -f "$BOOTLOCAL" ]; then
  echo "" >$BOOTLOCAL 
else  
  echo "" >>$BOOTLOCAL 
fi
echo "$MYBOOT2DOCKER/bootlocal.sh" >>$BOOTLOCAL 
chmod +x $BOOTLOCAL

$MYBOOT2DOCKER/tools/ascii-art.sh
echo "${C2}installed...!$C0"

$MYBOOT2DOCKER/tools/version.sh
echo -e "$C0"

$MYBOOT2DOCKER/bootlocal.sh
