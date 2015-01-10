#!/bin/sh

echo
echo "* Let's mount your roms"

ANSWER=""
ROMDIR=""
	echo
	echo "* I detect some devices"
	/sbin/blkid

	while [ "$ANSWER" != "q" ] || [ "$ANSWER" = "r" ]; do
        echo
        echo "-> Enter which device contains your roms [ex : /dev/sdb2] [q to exit, r to search new devices]"
        read ANSWER
        if [ "$ANSWER" = "q" ];then
            exit 0
        elif [ "$ANSWER" = "r" ];then
            echo "* I detect some devices"
            /sbin/blkid
        fi
    done

    if [ -e $ANSWER ]; then
        echo "* Create mount point"
        sudo mkdir -p /mnt/roms
        echo "* I try to mount $ANSWER"
        sudo mount $ANSWER /mnt/roms
        if [ $? -ne 0 ]; then
            echo "** error when mounting $ANSWER"
            echo "** you should manually put roms in ~/roms later"
            exit 1
        fi
        
        echo
        echo "* Where are roms?"
        echo "* I expect a directory looking like this : "
        echo "* '/mnt/roms/myroms' with subdirectories 'snes' 'nes' 'gb'..."
        echo
        echo "-> Default : /mnt/roms"

        read ROMDIR

        if [ ! -d $ROMDIR ]; then
            ROMDIR=/mnt/roms
        fi

        for d in $ROMDIR/*/; do
            echo "DEBUG $d"
            if [ -d ~/roms/$(basename $d)/ ]; then
                echo "* ~/roms/$(basename $d)" exists
                rm -rf ~/roms/$(basename $d)
            fi
            ln -v -s $d/ ~/roms/
        done
    else
        echo "** $ANSWER doesn't exist"
        echo "** you should manually put roms in ~/roms later"
        exit 1
    fi
    echo
    echo "* Now you should find your roms in ~/roms/CONSOLE_NAME"
    echo "* Run $0 again to reconfigure"
    echo "* Good game"

exit 0
