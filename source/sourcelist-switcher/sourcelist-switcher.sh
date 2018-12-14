#!/usr/bin/env bash

# Step 1: Collecting system version.
echo -e "\e[36mStep 1. Collecting your system infomation.\033[0m"
codename=$(lsb_release -a | grep -v LSB | grep Codename | awk '{print $2}')
if [ $codename = "xenial" ]
then
  echo -e "Found your system's codename is \033[35m$codename\033[0m"
  case $codename in 
    xenial)
      ;;
    *)
      echo "Not supported."
      exit 1
      ;;
  esac
fi

Q1() {
  echo -e "Is that right? (y/n)[y]: \c"
  read ans
  case $ans in
    y|"")
      echo "Setting codename to $codename"
      ;;
    n)
      echo "Thank you for using."
      exit 1
      ;;
    *)
      Q1
      ;;
  esac
}
Q1

# Step 2: Choosing the mirror you want to use.
echo -e "\e[36mStep 2. Choosing the mirror you want to use.\033[0m"
mirrors=("aliyun" "official" "163" "tsinghua")
echo $mirrors

echo -e "\033[32m[1]\033[0m aliyun (default)"
echo -e "\033[32m[2]\033[0m official (us mirror)"
echo -e "\033[32m[3]\033[0m 163"
echo -e "\033[32m[4]\033[0m tsinghua"

Q2() {
  echo -e "Which mirror you want to use? (1/2/3/4)[1]: \c"
  read ans
  case $ans in
    1|"")
      ans=1
      echo "Setting mirror to $ans"
      ;;
    2|3|4)
      echo "Setting mirror to $ans"
      ;;
    *)
      Q2
      ;;
  esac
  url="https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/sourcelist-switcher/sources/ubuntu/xenial/$mirrors[$ans].txt"
  echo -e "Downding sourcelist ..."
  sudo wget -q -O /etc/apt/sources.list.tmp $url 
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
  sudo mv /etc/apt/sources.list.tmp /etc/apt/sources.list
  echo -e "Successfully replace /etc/apt/sources.list"
  echo -e "The old version has been moved to /etc/apt/sources.list.back"
}
Q2

# Step 3: Updating ...
sudo apt update