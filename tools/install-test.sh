set -e

SRC=/mnt/sda1
if [ ! -n "$MYBOOT2DOCKER" ]; then
  MYBOOT2DOCKER=$SRC/myboot2docker
fi

C0="\033[0m"
C1="\033[0;33m"
C2="\033[0;32m"
C3="\033[0;34m"

chown docker:staff $MYBOOT2DOCKER/home/docker -R

BOOTLOCAL=$SRC/var/lib/boot2docker/bootlocal.sh
if [ ! -f "$BOOTLOCAL" ]; then
  echo "" >$BOOTLOCAL 
else  
  echo "" >>$BOOTLOCAL 
fi
echo "$MYBOOT2DOCKER/bootlocal.sh"            >>$BOOTLOCAL 
sed -i "1i export BOOTLOCAL=$BOOTLOCAL"         $MYBOOT2DOCKER/tools/uninstall.sh 
sed -i "1i export MYBOOT2DOCKER=$MYBOOT2DOCKER" $MYBOOT2DOCKER/tools/uninstall.sh 
sed -i "1i export MYBOOT2DOCKER=$MYBOOT2DOCKER" $MYBOOT2DOCKER/bootlocal.sh       
chmod +x $BOOTLOCAL

echo -e "$C2  ___  ___       ______             _   _____ ______           _              $C0"
echo -e "$C2  |  \/  |       | ___ \           | | / __  \|  _  \         | |             $C0"
echo -e "$C2  | .  . |_   _  | |_/ / ___   ___ | |_\`' / /'| | | |___   ___| | _____ _ __ $C0"
echo -e "$C2  | |\/| | | | | | ___ \/ _ \ / _ \| __| / /  | | | / _ \ / __| |/ / _ \ '__| $C0"
echo -e "$C2  | |  | | |_| | | |_/ / (_) | (_) | |_./ /___| |/ / (_) | (__|   <  __/ |    $C0"
echo -e "$C2  \_|  |_/\__, | \____/ \___/ \___/ \__\_____/|___/ \___/ \___|_|\_\___|_|    $C0"
echo -e "$C2           __/ |                                                              $C0"
echo -e "$C2          |___/                                          ....is now installed!$C0"
$MYBOOT2DOCKER/tools/version.sh
echo -e "$C0"
$MYBOOT2DOCKER/bootlocal.sh
