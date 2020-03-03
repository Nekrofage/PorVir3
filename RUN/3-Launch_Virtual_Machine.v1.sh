#!/bin/sh

MACADDRESS=`printf 'DE:AD:BE:EF:%02X:%02X' $((RANDOM%256)) $((RANDOM%256))`

currentuser="$(whoami)"

echo "Run Qemu"

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/media/$currentuser/nekroslin/ubuntu1404_32/lib/ ./ubuntu1404_32/bin/qemu-system-i386  -enable-kvm -k fr -m 1024 -sdl -soundhw hda,ac97 -vga std \
                    -drive file=/media/$currentuser/nekrosvhd/vhda.qcow2,format=qcow2,index=0,media=disk \
                    -drive file=/media/$currentuser/nekrosvhd/vhdb.qcow2,format=qcow2,index=1,media=disk \
                    -smp 2 -localtime \
                    -net nic,macaddr=$MACADDRESS -net tap,ifname=tap0,script=no \
                    -no-quit
