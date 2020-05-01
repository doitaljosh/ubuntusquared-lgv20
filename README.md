## Ubuntu^2: a full desktop experience for Ubuntu touch on the LG V20.

This is based off of Ubuntu 18.04 LTS. Other distros can be ran, simply by copying the init.sh script to the rootfs image, then modifying the ubuntusquared script to mount a different image name. 

### To install:

- Clone this GitHub repo to your Ubuntu touch device.
- Run the ./install.sh script as root. It will download the image file and extract everything.

### To run:

- Connect an external display, and a USB or Bluetooth keyboard/mouse using a USB Type-C dock.
- Run `ubuntusquared` as root. Your display resolution should be printed, and a 5 second countdown will start.
- Enjoy!

### Logging into the chroot:

- Default username: `ubuntu`
- Default password: `ubuntu`

### Logging into the chroot from SSH

- Login to your Ubuntu Touch system over SSH as you normally would.
- Run `sudo chroot /ubuntusquared /bin/bash`

### Google Drive link to file (note: this is downloaded automatically by the install script)
[Click here](https://drive.google.com/file/d/1VsQNecT6h2GW3da6ynuS_403YR0iCgpt/view?usp=sharing)
