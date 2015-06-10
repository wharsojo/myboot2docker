# ------------------------------------
# Docker alias and function
# ------------------------------------

alias   di="docker images"   # Get images
alias   dl="docker ps -lq"   # Get latest container ID
alias   dp="docker ps"       # Get container process
alias  dpa="docker ps  -a"   # Get process included stop container
alias  dpq="docker ps  -aq"  # Get process included stop container, Only display numeric IDs
alias  drd="docker run -dP"  # Run deamonized container, e.g., $dkd base /bin/echo hello
alias  dri="docker run -itP" # Run interactive container, e.g., $dki base /bin/bash
alias  dsr='dstop && drm'    # Stop and Remove all containers
alias  dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'" # Get container IP

dstop() { docker stop $(dpq); }   # Stop   all containers
drm()   { docker rm   $(dpq); }   # Remove all containers
dri()   { docker rmi  $(dpq); }   # Remove all images
dbu()   { docker build -t=$1 .; } # Dockerfile build, e.g., $dbu tcnksm/test 
dalias(){ alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; } # Show all alias related docker