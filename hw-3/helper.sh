#!/bin/bash

function install() {
    echo 'Install software'
    sudo apt update -y && sudo apt upgrade
    sudo apt install git htop tree locate -y
};

function info() {
    echo "Memory usage:";
    free -h

    printf '\n'

    echo "Disc usage:";
    df -h | grep /dev/sd[a-z][1-9]

    printf '\n'

    echo "Uptime: "
    uptime | awk -F  "," '/1/ {print $1}'
};

if [ "$1" == "install" ]; then
    install;
    exit;
fi;

if [ "$1" == "info" ]; then
    info;
    exit;
fi;

echo "Undefined command: $1"