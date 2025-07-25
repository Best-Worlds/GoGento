#!/usr/bin/env bash
# Instructions for installing go through GVM tool within a warp container
warp php ssh --root
apt update
apt-get install bsdmainutils
apt-get install bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
export GVM_ROOT=$HOME/.gvm
. $GVM_ROOT/scripts/gvm-default
gvm install go1.24.5 -B
gvm use go1.24.5 --default
go mod tidy

# Refresh file to use "go" commands
echo "Please restart your terminal session or to get started right away run
       `source /root/.gvm/scripts/gvm`"

# Run application
go run magento.go

