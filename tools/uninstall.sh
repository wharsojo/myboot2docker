set -e

echo "Removing $MYBOOT2DOCKER"
if [[ -d $MYBOOT2DOCKER ]]; then
  rm -rf $MYBOOT2DOCKER
fi

echo "Thanks for trying out My Boot2Docker. It's been uninstalled."
echo "please remove configuration in $BOOTLOCAL"