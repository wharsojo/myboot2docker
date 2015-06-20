echo boot local...

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker
DOC=/home/docker
M2D=$MYBOOT2DOCKER$DOC

rm /tmp/tce/optional -rf
ln -s  $MYBOOT2DOCKER/tmp/tce/optional /tmp/tce/optional
ln -s  $M2D/build                      $DOC/build
ln -s  $M2D/.zpreztorc                 $DOC/.zpreztorc
ln -s  $M2D/.zshrc                     $DOC/.zshrc
ln -s  $M2D/.zprezto                   $DOC/.zprezto
ln -sf $M2D/.zhistory                  $DOC/.zhistory
ln -s  $DOC/.zprezto/runcoms/zlogin    $DOC/.zlogin
ln -s  $DOC/.zprezto/runcoms/zlogout   $DOC/.zlogout
ln -s  $DOC/.zprezto/runcoms/zprofile  $DOC/.zprofile
ln -s  $DOC/.zprezto/runcoms/zshenv    $DOC/.zshenv

LIB=/usr/local/lib
BIN=/usr/local/bin
SHR=/usr/local/share
M2L=$MYBOOT2DOCKER$LIB
M2B=$MYBOOT2DOCKER$BIN
M2S=$MYBOOT2DOCKER$SHR

ln -s  $M2B/tmux $BIN/tmux
ln -s  $M2B/zsh  $BIN/zsh
ln -s  $M2L/zsh  $LIB/zsh
ln -s  $M2S/zsh  $SHR/zsh
ln -s  $MYBOOT2DOCKER/tools/uninstall.sh    $BIN/myboot2docker_uninstall

ln -s  $M2L/libevent-2.0.so.5.1.10          $LIB/libevent-2.0.so.5.1.10
ln -s  $LIB/libevent-2.0.so.5.1.10          $LIB/libevent-2.0.so.5
ln -s  $LIB/libevent-2.0.so.5.1.10          $LIB/libevent.so
ln -s  $M2L/libevent_core-2.0.so.5.1.10     $LIB/libevent_core-2.0.so.5.1.10
ln -s  $LIB/libevent_core-2.0.so.5.1.10     $LIB/libevent_core-2.0.so.5
ln -s  $LIB/libevent_core-2.0.so.5.1.10     $LIB/libevent_core.so
ln -s  $M2L/libevent_extra-2.0.so.5.1.10    $LIB/libevent_extra-2.0.so.5.1.10
ln -s  $LIB/libevent_extra-2.0.so.5.1.10    $LIB/libevent_extra-2.0.so.5
ln -s  $LIB/libevent_extra-2.0.so.5.1.10    $LIB/libevent_extra.so
ln -s  $M2L/libevent_openssl-2.0.so.5.1.10  $LIB/libevent_openssl-2.0.so.5.1.10
ln -s  $LIB/libevent_openssl-2.0.so.5.1.10  $LIB/libevent_openssl-2.0.so.5
ln -s  $LIB/libevent_openssl-2.0.so.5.1.10  $LIB/libevent_openssl.so
ln -s  $M2L/libevent_pthreads-2.0.so.5.1.10 $LIB/libevent_pthreads-2.0.so.5.1.10
ln -s  $LIB/libevent_pthreads-2.0.so.5.1.10 $LIB/libevent_pthreads-2.0.so.5
ln -s  $LIB/libevent_pthreads-2.0.so.5.1.10 $LIB/libevent_pthreads.so

ldconfig -X 2&>1 >/dev/null # reload - ldd cache (after creating simlink...)

which zsh | tee -a /etc/shells > /dev/null
sed -i "/$(cat /etc/sysconfig/tcuser)/    s#:[^:]\+\$#:$(which zsh)#" /etc/passwd
