if [[ $(tty |grep -Eo "/dev/tty") = "/dev/tty" ]]; then 
        startx
fi
