echo boot local...

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker

rm /tmp/tce/optional -rf
ln -s  $MYBOOT2DOCKER/tmp/tce/optional        /tmp/tce/optional
ln -s  $MYBOOT2DOCKER/home/docker/build       /home/docker/build
ln -s  $MYBOOT2DOCKER/home/docker/.zpreztorc  /home/docker/.zpreztorc
ln -s  $MYBOOT2DOCKER/home/docker/.zshrc      /home/docker/.zshrc
ln -s  $MYBOOT2DOCKER/home/docker/.zprezto    /home/docker/.zprezto
ln -sf $MYBOOT2DOCKER/home/docker/.zhistory   /home/docker/.zhistory
ln -s  /home/docker/.zprezto/runcoms/zlogin   /home/docker/.zlogin
ln -s  /home/docker/.zprezto/runcoms/zlogout  /home/docker/.zlogout
ln -s  /home/docker/.zprezto/runcoms/zprofile /home/docker/.zprofile
ln -s  /home/docker/.zprezto/runcoms/zshenv   /home/docker/.zshenv

ln -s  $MYBOOT2DOCKER/usr/local/share/zsh     /usr/local/share/zsh
ln -s  $MYBOOT2DOCKER/usr/local/bin/tmux      /usr/local/bin/tmux
ln -s  $MYBOOT2DOCKER/usr/local/lib/zsh       /usr/local/lib/zsh
ln -s  $MYBOOT2DOCKER/usr/local/bin/zsh       /usr/local/bin/zsh
ln -s  $MYBOOT2DOCKER/tools/uninstall.sh      /usr/local/bin/myboot2docker_uninstall

ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent-2.0.so.5.1.10           /usr/local/lib/libevent.so
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent-2.0.so.5.1.10           /usr/local/lib/libevent-2.0.so.5
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent-2.0.so.5.1.10           /usr/local/lib/libevent-2.0.so.5.1.10
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent.a                       /usr/local/lib/libevent.a
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent.la                      /usr/local/lib/libevent.la
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_core-2.0.so.5.1.10      /usr/local/lib/libevent_core.so
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_core-2.0.so.5.1.10      /usr/local/lib/libevent_core-2.0.so.5
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_core-2.0.so.5.1.10      /usr/local/lib/libevent_core-2.0.so.5.1.10
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_core.a                  /usr/local/lib/libevent_core.a
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_core.la                 /usr/local/lib/libevent_core.la
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_extra-2.0.so.5.1.10     /usr/local/lib/libevent_extra.so
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_extra-2.0.so.5.1.10     /usr/local/lib/libevent_extra-2.0.so.5
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_extra-2.0.so.5.1.10     /usr/local/lib/libevent_extra-2.0.so.5.1.10
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_extra.a                 /usr/local/lib/libevent_extra.a
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_extra.la                /usr/local/lib/libevent_extra.la
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_openssl-2.0.so.5.1.10   /usr/local/lib/libevent_openssl.so
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_openssl-2.0.so.5.1.10   /usr/local/lib/libevent_openssl-2.0.so.5
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_openssl-2.0.so.5.1.10   /usr/local/lib/libevent_openssl-2.0.so.5.1.10
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_openssl.a               /usr/local/lib/libevent_openssl.a
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_openssl.la              /usr/local/lib/libevent_openssl.la
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_pthreads-2.0.so.5.1.10  /usr/local/lib/libevent_pthreads.so
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_pthreads-2.0.so.5.1.10  /usr/local/lib/libevent_pthreads-2.0.so.5
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_pthreads-2.0.so.5.1.10  /usr/local/lib/libevent_pthreads-2.0.so.5.1.10
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_pthreads.a              /usr/local/lib/libevent_pthreads.a
ln -s  $MYBOOT2DOCKER/usr/local/lib/libevent_pthreads.la             /usr/local/lib/libevent_pthreads.la

# MUSL=$MYBOOT2DOCKER/tmp/tcloop/musl
# ln -s $MUSL/lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1

ldconfig -X  # reload - ldd cache (after creating simlink...)

which zsh | tee -a /etc/shells > /dev/null
sed -i "/$(cat /etc/sysconfig/tcuser)/    s#:[^:]\+\$#:$(which zsh)#" /etc/passwd
