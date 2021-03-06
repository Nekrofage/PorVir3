#!/bin/bash

# Qemu 2.11.1 / 3.0.0 / 4.2.0
# Ubuntu / Lubuntu / FreeBSD / GhostBSD
# 32 / 64
# Monouser / Multiuser

QEVER=
G_DISTRIB=
G_VERSION=
G_PROC=
APP=
VDA=

case "$1" in
	1) echo "- Qemu -"
    echo "2.11.1"
	QEVER=2.11.1
	;;

	2) echo "- Qemu -"
    echo "3.0.0"
	QEVER=3.0.0
	;;

	3) echo "- Qemu -"
    echo "4.2.0"
	QEVER=4.2.0
	;;

	4) echo "- Qemu -"
    echo "2.5.0"
	QEVER=2.5.0
	;;

	5) echo "- Qemu -"
    echo "5.0.0"
	QEVER=5.0.0
	;;


	6) echo "- Qemu -"
    echo "5.1.0"
	QEVER=5.1.0
	;;

	7) echo "- Qemu -"
    echo "6.0.0"
	QEVER=6.0.0
	;;


    h) echo "Help:"
        echo "Qemu version:"
        echo "1 - 2.11.1"
        echo "2 - 2.0.0"
        echo "3 - 4.2.0"
        echo 
        echo "Distribution name:"
        echo "1 - Ubuntu"
        echo "2 - Lubuntu"
        echo "3 - FreeBSD"
        echo "3 - GhostBSD"
        echo 
        echo "Distribution version:"
        echo "1 - 18.04"
        echo "2 - 19.10"
        echo "3 - 12.01"
        echo "3 - 20.01"
        echo 
        echo "Architecture:"
        echo "1 - 32"
        echo "2 - 64"
        ;;

	*) echo "Version not found"
    ;;
esac	


echo "- Distribution -"
case "$2" in
	1) echo "Ubuntu"
	G_DISTRIB=UBUNTU
	;;

	2) echo "Lubuntu"
	G_DISTRIB=LUBUNTU
	;;

	3) echo "FreeBSD"
	G_DISTRIB=FREESBSD
	;;

	4) echo "GhostBSD"
	G_DISTRIB=GHOSTBSD
	;;


	5) echo "LXLE"
	G_DISTRIB=LXLE
	;;

    *) echo "Distribution not found"
    ;;

esac


echo "- Version -"
case "$3" in
	1) echo "18.04"
	G_VERSION=18.04
	;;

	2) echo "19.10"
    G_VERSION=19.10
	;;

	3) echo "12.01"
    G_VERSION=12.01
	;;

	4) echo "20.01"
    G_VERSION=20.01
	;;

	5) echo "16.04"
    G_VERSION=16.04
	;;


    *) echo "Version not found"
    ;;

esac


echo "- Architecture -"
case "$4" in
	1) echo "32"
	G_PROC=32
	;;

	2) echo "64"
	G_PROC=64
	;;
    *) echo "Architecture not found"
    ;;
esac


echo "- Tap -"
TAP=$5


echo "- Virtual disk -"
echo "vda"
VDA=vda

echo "- Application -"
case "$6" in
	*) 
	APP=`echo $6 | tr a-z A-Z`
    echo $APP
	;;
esac


echo "=============================="
echo "Virtual machine configuration:"

echo $QEVER
echo $G_DISTRIB
echo $G_VERSION
echo $G_PROC
echo $VDA
echo $APP

