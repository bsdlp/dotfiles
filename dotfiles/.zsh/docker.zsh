#function dc() {
    #docker ps -a | awk '!/^CONT/ {print $1}' | xargs docker rm
    #docker images | awk '!/^REPO/ {print $3}' | xargs docker rmi -f
#}
#
function dc() {
    docker container prune -f
    docker image prune -a -f
}

alias dm='eval "$(docker-machine env default)"'
