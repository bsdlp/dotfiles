[[ -e $HOME/.ssh/sock/ ]] || mkdir -p ~/.ssh/sock/

function kill_ssh_socket {
    if [ -z "$1" ] ; then
        echo 'can you specify a socket please?'
        return 1
    else
        rm $HOME/.ssh/sock/*\;$1
        return 0
    fi
}

alias sk='kill_ssh_socket'
