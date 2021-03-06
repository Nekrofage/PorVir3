#!/bin/bash


echo "1st launch"
echo "1" > .lock


echo "*************************************************"
echo "Initialize_Network"

networkinterface=`ip addr show | awk '/inet.*brd/{print $NF; exit}'`

sudo ip addr flush dev $networkinterface
sudo ip link set $networkinterface up
sudo ip link add name br0 type bridge

sleep 2

sudo ip link set $networkinterface master br0
sudo ip addr add 192.168.1.3/24 dev br0

sleep 2

sudo ip link set br0 up
sudo ip route add default via 192.168.1.1

sleep 2 

sudo ip tuntap add tap0 mode tap
sudo ip link set tap0 up
sudo ip link set tap0 master br0

sleep 2 

sudo ip tuntap add tap1 mode tap
sudo ip link set tap1 up
sudo ip link set tap1 master br0

sleep 2 

sudo ip tuntap add tap2 mode tap
sudo ip link set tap2 up
sudo ip link set tap2 master br0

sleep 2 

sudo ip tuntap add tap3 mode tap
sudo ip link set tap3 up
sudo ip link set tap3 master br0


sleep 2

sudo brctl show

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf >/dev/null


echo "*************************************************"
echo "Initialize Virtualization"

sudo modprobe kvm
sudo modprobe kvm-amd

sudo adduser $USER kvm
sudo chown root:$USER /dev/kvm
