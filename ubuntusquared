#!/bin/bash

# run-chroot.sh
# Run this script as root once you have connected an external monitor.
# A separate Ubuntu system should show up with a login prompt.
# Bluetooth or USB input devices should work.

FBMODES=$(head -n 1 /sys/class/graphics/fb1/modes)

if [[ $EUID -ne 0 ]]; then
	echo "Please run this script as root." 
	exit 1
fi

if [[ $FBMODES == "U:640x480p-60" ]]; then # This is the default mode for the DP aux display driver.
	echo "External display not connected. Exiting..."
	exit 1
else
	echo "Detected a monitor running at "$(echo $FBMODES | sed -n 's/.*x\([^ ]*\)p*/\1/p')"FPS"
fi

clear

for i in {5..1}; do
	echo -n "Starting in "$i" sec"
	sleep 1
	clear
done

# System image
mount -t ext4 -o loop /userdata/ubuntu-rootfs.img /ubuntu-desktop

# Core filesystems
mount -o bind /proc /ubuntu-desktop/proc
mount -o bind /sys /ubuntu-desktop/sys
mount -o bind /dev /ubuntu-desktop/dev
mount -t devpts devpts /ubuntu-desktop/dev/pts
mount -t tmpfs tmpfs /ubuntu-desktop/tmp

# Access certain features from UT system inside chroot
mount -o bind /run/udev /ubuntu-desktop/run/udev # Without this, keyboards, mice, and other devices won't be detected.
mount -o bind /run/lxc /ubuntu-desktop/run/lxc
mount -o bind /run/wpa_supplicant /ubuntu-desktop/run/wpa_supplicant
mount -o bind /run/hybris-usb /ubuntu-desktop/run/hybris-usb
mount -o bind /var/lib/lxc/android /ubuntu-desktop/var/lib/lxc/android # Android container files
mount -o bind /userdata/user-data /ubuntu-desktop/home-ut # UT home folder

# Stop the UT GUI as it will lock the framebuffer of the external display.
# There might be a way to free the framebuffer from UT during runtime, and
# not have to stop UT, but for now, this is what works.
service lightdm stop

# Start the chroot and run it's init helper script.
chroot /ubuntu-desktop /init.sh
