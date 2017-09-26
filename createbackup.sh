#!/usr/bin/env bash
#backup
#dd if=/dev/mmcblk0 of=mbr_image bs=446 count=1
#sfdisk -d /dev/mmcblk0 > pi_partitions
#tar cvpJf - --one-file-system / | ssh user@host "cat > turboraspbian.img.xz"   

#restore
#dd if=mbr_image of=/dev/mmcblk0 
#sfdisk /dev/mmcblk0 < pi_partitions
#tar xvJf turboraspbian.img

dd if=/dev/mmcblk0 bs=4k | xz -zf - | ssh user@host "cat > turboraspbian.img.xz"   