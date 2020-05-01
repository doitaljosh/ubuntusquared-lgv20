#!/bin/bash

# Ubuntu^2 installation script

# Check if we are root
if [[ $EUID -ne 0 ]]; then
        echo "Installation must be done as root." 
        exit 1
fi

echo "Welcome to Ubuntu^2 (UbuntuOnUbuntu)"

downloadAndExtract() {
	fileid='1VsQNecT6h2GW3da6ynuS_403YR0iCgpt'
	filename='ubuntu-rootfs.img.tar.gz'
	echo "Downloading rootfs"
	wget --save-cookies /tmp/cookies-ubuntusquared.txt 'https://docs.google.com/uc?export=download&id='$fileid -O- \
	| sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > /tmp/confirm-ubuntusquared.txt
	wget --load-cookies /tmp/cookies-ubuntusquared.txt -O $filename \
	'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(</tmp/confirm-ubuntusquared.txt)
	echo "Extracting rootfs"
	tar -C /userdata/ -xzpf ubuntu-rootfs.img.tar.gz
}

downloadAndExtract
echo "Copying scripts"
mount -o remount,rw /
cp ubuntusquared /usr/bin/
mkdir /ubuntusquared

echo "Done. Run '$ sudo ubuntusquared' with an external display connected to boot to Ubuntu Desktop."

