#!/usr/bin/env bash

# collecting system version
echo -e "\e[36m1. Collecting system version ...\033[0m"
codename=$(lsb_release -a | grep -v LSB | grep Codename | awk '{print $2}')
if [ $codename = 'xenial' ]
then 
    echo -e "Found your system's codename is \033[45;37m$codename\033[0m"
fi