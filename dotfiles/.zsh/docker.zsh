function dc() {
    docker ps -a | awk '!/^CONT/ {print $1}' | xargs docker rm
    docker images | awk '!/^REPO/ {print $3}' | xargs docker rmi -f
}

alias dm='$(docker-machine env)'
