# ------------------------------------
# Docker alias and function
# ------------------------------------

alias   di="docker images"   # Get images
alias   dl="docker ps -lq"   # Get latest container ID
alias   dp="docker ps"       # Get container process
alias   dx="docker exec -it" # Run specific app on running Container
alias  dpa="docker ps  -a"   # Get process included stop container
alias  dpq="docker ps  -aq"  # Get process included stop container, Only display numeric IDs
alias  drd="docker run -dP"  # Run deamonized container, e.g., $dkd base /bin/echo hello
alias  dri="docker run -itP" # Run interactive container, e.g., $dki base /bin/bash
alias  dsr='dkill && drm'    # Kill and Remove all containers
alias  drv="docker run -itP -v /Users:/home" # Run with /Users volume as home
alias  dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'" # Get container IP
alias  dclean='docker rmi $(docker images -qf "dangling=true")' # remove dangling images
alias  dr-ls="curl -X GET http://localhub:5000/v1/search"

dbl()    { docker build -t=$1 .; } # Dockerfile build, e.g., $dbu tcnksm/test 
drm()    { docker rm   $(docker ps  -aq);  }   # Remove all containers
drmi()   { docker rmi  $(docker ps  -aq);  }   # Remove all images
drme()   { docker rmi  $(docker images | grep "^<none>" | awk '{  print $3 }') } 
dstop()  { docker stop $(docker ps  -aq);  }   # Stop   all containers
dkill()  { docker kill $(docker ps  -aq);  }   # Kill   all containers
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; } # Show all alias related docker
dr-rm()  {
    echo curl -X DELETE http://localhub:5000/v1/repositories/library/$1/  
    curl -X DELETE http://localhub:5000/v1/repositories/library/$1/; 
}
