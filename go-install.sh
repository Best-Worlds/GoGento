#!/usr/bin/env bash

if [[ "$(basename "$PWD")" != "go" ]];
then
    printf "\e[0m\n"
    printf "\e[31m You need to execute under “go” folder \n"
    printf "\e[0m\n"
    exit 1;
fi

# Instructions for installing go through GVM tool within a warp container
apt update
apt-get install bsdmainutils
apt-get install bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
export GVM_ROOT=$HOME/.gvm
. $GVM_ROOT/scripts/gvm-default
gvm install go1.24.5 -B
gvm use go1.24.5 --default
go mod tidy

# creating log file
mkdir var/
mkdir var/log/
touch var/log/app.log
chown warp:www-data var/ -R
printf "\e[0m\n"
printf "\e[36m Log file created on: \n"
printf "\e[0m var/log/app.log \n"

# Refresh file to use "go" commands
printf "\e[0m\n"
printf "\e[36m Please restart your terminal session or to get started right away run: \n"
printf "\e[0m source /root/.gvm/scripts/gvm \n"

# Run application
printf "\e[0m\n"
printf "\e[36m Start GoGento application: \n"
printf "\e[0m go run magento.go \n"
printf "\e[0m\n"



