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

dbu()    { docker build -t=$1 .; } # Dockerfile build, e.g., $dbu tcnksm/test 
drm()    { docker rm   $(docker ps  -aq); }   # Remove all containers
drmi()   { docker rmi  $(docker ps  -aq); }   # Remove all images
dstop()  { docker stop $(docker ps  -aq); }   # Stop   all containers
dalias(){ alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; } # Show all alias related docker