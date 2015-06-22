echo boot local...

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker
DOC=/home/docker
M2D=$MYBOOT2DOCKER$DOC

rm /tmp/tcloop -rf
rm /tmp/tce/optional -rf
ln -s  $MYBOOT2DOCKER/tmp/tcloop       /tmp/tcloop
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
INC=/usr/local/include
TCE=/usr/local/tce.installed
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

BZP=/tmp/tcloop/bzip2-lib
ln -s  $BZP$LIB/libbz2.so                   $LIB/libbz2.so
ln -s  $BZP$LIB/libbz2.so.1.0               $LIB/libbz2.so.1.0
ln -s  $BZP$LIB/libbz2.so.1.0.6             $LIB/libbz2.so.1.0.6

RDL=/tmp/tcloop/readline
ln -s  $RDL$LIB/libhistory.so               $LIB/libhistory.so
ln -s  $RDL$LIB/libhistory.so.6             $LIB/libhistory.so.6
ln -s  $RDL$LIB/libhistory.so.6.3           $LIB/libhistory.so.6.3
ln -s  $RDL$LIB/libreadline.so              $LIB/libreadline.so
ln -s  $RDL$LIB/libreadline.so.6            $LIB/libreadline.so.6
ln -s  $RDL$LIB/libreadline.so.6.3          $LIB/libreadline.so.6.3

SQL=/tmp/tcloop/sqlite3
ln -s   $SQL$LIB/libsqlite3.so              $LIB/libsqlite3.so
ln -s   $SQL$LIB/libsqlite3.so.0            $LIB/libsqlite3.so.0
ln -s   $SQL$LIB/libsqlite3.so.0.8.6        $LIB/libsqlite3.so.0.8.6

GDB=/tmp/tcloop/gdbm
ln -s   $GDB$LIB/libgdbm.so                 $LIB/libgdbm.so
ln -s   $GDB$LIB/libgdbm.so.4               $LIB/libgdbm.so.4
ln -s   $GDB$LIB/libgdbm.so.4.0.0           $LIB/libgdbm.so.4.0.0
ln -s   $GDB$LIB/libgdbm_compat.so          $LIB/libgdbm_compat.so
ln -s   $GDB$LIB/libgdbm_compat.so.4        $LIB/libgdbm_compat.so.4
ln -s   $GDB$LIB/libgdbm_compat.so.4.0.0    $LIB/libgdbm_compat.so.4.0.0 

PYT=/tmp/tcloop/python
ln -s   $PYT$LIB/python2.7                  $LIB/python2.7
ln -s   $PYT$LIB/libpython2.7.so            $LIB/libpython2.7.so
ln -s   $PYT$LIB/libpython2.7.so.1.0        $LIB/libpython2.7.so.1.0
ln -s   $PYT$SHR/python/files/files.tar.gz  $SHR/python/files/files.tar.gz
ln -s   $PYT$INC/python2.7/pyconfig.h       $INC/python2.7/pyconfig.h
ln -s   $PYT$TCE/python                     $TCE/python

ln -s   $GDB$BIN/gdbmtool                   $BIN/gdbmtool
ln -s   $GDB$BIN/gdbm_dump                  $BIN/gdbm_dump
ln -s   $GDB$BIN/gdbm_load                  $BIN/gdbm_load
ln -s   $PYT$BIN/docker-compose             $BIN/docker-compose
ln -s   $PYT$BIN/python2.7                  $BIN/python2.7
ln -s   $PYT$BIN/python2.7-config           $BIN/python2.7-config
ln -s   $PYT$BIN/pip                        $BIN/pip
ln -s       $BIN/python2                    $BIN/python
ln -s       $BIN/python2.7                  $BIN/python2
ln -s       $BIN/python2-config             $BIN/python-config
ln -s       $BIN/python2.7-config           $BIN/python2-config

ldconfig -X 2&>1 >/dev/null # reload - ldd cache (after creating simlink...)

which zsh | tee -a /etc/shells > /dev/null
sed -i "/$(cat /etc/sysconfig/tcuser)/    s#:[^:]\+\$#:$(which zsh)#" /etc/passwd
