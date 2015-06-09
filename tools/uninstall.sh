set -e

SRC="`df | grep  '/mnt/sd[a-z][0-9]/var/lib/docker/' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker
echo "Removing $MYBOOT2DOCKER"
if [[ -d $MYBOOT2DOCKER ]]; then
  rm -rf $MYBOOT2DOCKER
fi

BOOTLOCAL=$SRC/var/lib/boot2docker/bootlocal.sh
echo "Thanks for trying out My Boot2Docker. It's been uninstalled."
echo "please remove configuration in $BOOTLOCAL"