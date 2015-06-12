echo boot local...

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker

rm /tmp/tce/optional -rf
ln -s  $MYBOOT2DOCKER/tmp/tce/optional          /tmp/tce/optional
ln -s  $MYBOOT2DOCKER/home/docker/build         /home/docker/build
ln -s  $MYBOOT2DOCKER/home/docker/.zpreztorc    /home/docker/.zpreztorc
ln -s  $MYBOOT2DOCKER/home/docker/.zshrc        /home/docker/.zshrc
ln -s  $MYBOOT2DOCKER/home/docker/.zprezto      /home/docker/.zprezto
ln -sf $MYBOOT2DOCKER/home/docker/.zhistory     /home/docker/.zhistory
ln -s  /home/docker/.zprezto/runcoms/zlogin     /home/docker/.zlogin
ln -s  /home/docker/.zprezto/runcoms/zlogout    /home/docker/.zlogout
ln -s  /home/docker/.zprezto/runcoms/zprofile   /home/docker/.zprofile
ln -s  /home/docker/.zprezto/runcoms/zshenv     /home/docker/.zshenv

ln -s  $MYBOOT2DOCKER/usr/local/share/zsh          /usr/local/share/zsh
ln -s  $MYBOOT2DOCKER/usr/local/lib/zsh            /usr/local/lib/zsh
ln -s  $MYBOOT2DOCKER/usr/local/bin/zsh            /usr/local/bin/zsh
ln -s  $MYBOOT2DOCKER/usr/local/bin/tmux           /usr/local/bin/tmux
ln -s  $MYBOOT2DOCKER/usr/local/bin/docker-compose /usr/local/bin/docker-compose
ln -s  $MYBOOT2DOCKER/tools/uninstall.sh           /usr/local/bin/myboot2docker_uninstall

NCURSES=$MYBOOT2DOCKER/tmp/tcloop/ncurses

ln -s  $NCURSES/usr/local/lib/libcurses.so      /usr/local/lib/libcurses.so
ln -s  $NCURSES/usr/local/lib/libform.so        /usr/local/lib/libform.so
ln -s  $NCURSES/usr/local/lib/libform.so.5      /usr/local/lib/libform.so.5
ln -s  $NCURSES/usr/local/lib/libform.so.5.9    /usr/local/lib/libform.so.5.9
ln -s  $NCURSES/usr/local/lib/libmenu.so        /usr/local/lib/libmenu.so
ln -s  $NCURSES/usr/local/lib/libmenu.so.5      /usr/local/lib/libmenu.so.5
ln -s  $NCURSES/usr/local/lib/libmenu.so.5.9    /usr/local/lib/libmenu.so.5.9
ln -s  $NCURSES/usr/local/lib/libncurses.so     /usr/local/lib/libncurses.so
ln -s  $NCURSES/usr/local/lib/libncurses.so.5   /usr/local/lib/libncurses.so.5
ln -s  $NCURSES/usr/local/lib/libncurses.so.5.9 /usr/local/lib/libncurses.so.5.9
ln -s  $NCURSES/usr/local/lib/libpanel.so       /usr/local/lib/libpanel.so
ln -s  $NCURSES/usr/local/lib/libpanel.so.5     /usr/local/lib/libpanel.so.5
ln -s  $NCURSES/usr/local/lib/libpanel.so.5.9   /usr/local/lib/libpanel.so.5.9
ln -s  $NCURSES/usr/local/lib/libtermcap.so     /usr/local/lib/libtermcap.so
ln -s  $NCURSES/usr/local/lib/libtinfo.so       /usr/local/lib/libtinfo.so
ln -s  $NCURSES/usr/local/lib/libtinfo.so.5     /usr/local/lib/libtinfo.so.5
ln -s  $NCURSES/usr/local/lib/libtinfo.so.5.9   /usr/local/lib/libtinfo.so.5.9
ln -s  $NCURSES-common/usr/local/lib/terminfo   /usr/local/lib/terminfo
ln -s  $NCURSES-common/usr/local/share/tabset   /usr/local/share/tabset
ln -s  $NCURSES-common/usr/local/share/terminfo /usr/local/share/terminfo

LIBEVENT=$MYBOOT2DOCKER/tmp/tcloop/libevent

ln -s $LIBEVENT/usr/local/lib/libevent-1.4.so.2           /usr/local/lib/libevent-1.4.so.2
ln -s $LIBEVENT/usr/local/lib/libevent-1.4.so.2.2.0       /usr/local/lib/libevent-1.4.so.2.2.0
ln -s $LIBEVENT/usr/local/lib/libevent-2.0.so.5           /usr/local/lib/libevent-2.0.so.5
ln -s $LIBEVENT/usr/local/lib/libevent-2.0.so.5.0.1       /usr/local/lib/libevent-2.0.so.5.0.1
ln -s $LIBEVENT/usr/local/lib/libevent.so                 /usr/local/lib/libevent.so
ln -s $LIBEVENT/usr/local/lib/libevent_core-1.4.so.2      /usr/local/lib/libevent_core-1.4.so.2
ln -s $LIBEVENT/usr/local/lib/libevent_core-1.4.so.2.2.0  /usr/local/lib/libevent_core-1.4.so.2.2.0
ln -s $LIBEVENT/usr/local/lib/libevent_core-2.0.so.5      /usr/local/lib/libevent_core-2.0.so.5
ln -s $LIBEVENT/usr/local/lib/libevent_core-2.0.so.5.0.1  /usr/local/lib/libevent_core-2.0.so.5.0.1
ln -s $LIBEVENT/usr/local/lib/libevent_core.so            /usr/local/lib/libevent_core.so
ln -s $LIBEVENT/usr/local/lib/libevent_extra-1.4.so.2     /usr/local/lib/libevent_extra-1.4.so.2
ln -s $LIBEVENT/usr/local/lib/libevent_extra-1.4.so.2.2.0 /usr/local/lib/libevent_extra-1.4.so.2.2.0
ln -s $LIBEVENT/usr/local/lib/libevent_extra-2.0.so.5     /usr/local/lib/libevent_extra-2.0.so.5
ln -s $LIBEVENT/usr/local/lib/libevent_extra-2.0.so.5.0.1 /usr/local/lib/libevent_extra-2.0.so.5.0.1
ln -s $LIBEVENT/usr/local/lib/libevent_extra.so           /usr/local/lib/libevent_extra.so
ln -s $LIBEVENT/usr/local/lib/libevent_pthreads-2.0.so.5  /usr/local/lib/libevent_pthreads-2.0.so.5
ln -s $LIBEVENT/usr/local/lib/libevent_pthreads-2.0.so.5.0.1  /usr/local/lib/libevent_pthreads-2.0.so.5.0.1
ln -s $LIBEVENT/usr/local/lib/libevent_pthreads.so        /usr/local/lib/libevent_pthreads.so
ln -s $LIBEVENT/usr/local/bin/event_rpcgen.py             /usr/bin/event_rpcgen.py

# MUSL=$MYBOOT2DOCKER/tmp/tcloop/musl
# ln -s $MUSL/lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1

ldconfig -X  # reload - ldd cache (after creating simlink...)

which zsh | tee -a /etc/shells > /dev/null
sed -i "/$(cat /etc/sysconfig/tcuser)/    s#:[^:]\+\$#:$(which zsh)#" /etc/passwd
