#!/usr/bin/env bash

echo -e "\e[36m*************************************************\033[0m"
echo -e "\e[36m*              Sourcelist Switcher              *\033[0m"
echo -e "\e[36m*  @auther: wang.yuanqiu007@gmail.com           *\033[0m"
echo -e "\e[36m*  @github: https://github.com/vincent0700      *\033[0m"
echo -e "\e[36m*************************************************\033[0m"

# Step 1: Collecting system version.
echo -e "\r\n\e[36mStep 1. Select your system version.\033[0m"
versions=("trusty" "xenial" "bionic" )
paths=("ubuntu/trusty" "ubuntu/xenial" "ubuntu/bionic")

echo -e "\033[32m[1]\033[0m ubuntu 14.04 trusty (default)"
echo -e "\033[32m[2]\033[0m ubuntu 16.04 xenial"
echo -e "\033[32m[3]\033[0m ubuntu 18.04 bionic"

Q1() {
  echo -e "Which version is your system? (1/2/3)[1]: \c"
  read ans
  case $ans in
    1|"")
      ans=1
      echo -e "You choose \033[45;37m${versions[$ans-1]}\033[0m"
      ;;
    2)
      echo -e "You choose \033[45;37m${versions[$ans-1]}\033[0m"
      ;;
    *)
      Q1
      ;;
  esac
  version=${versions[$ans-1]}
  path=${paths[$ans-1]}
}
Q1

# Step 2: Choosing the mirror you want to use.
echo -e "\r\n\e[36mStep 2. Select the mirror you want to use.\033[0m"
mirrors=("aliyun" "official" "163" "tsinghua" "ustc")

echo -e "\033[32m[1]\033[0m aliyun (default)"
echo -e "\033[32m[2]\033[0m official (us mirror)"
echo -e "\033[32m[3]\033[0m 163"
echo -e "\033[32m[4]\033[0m tsinghua"
echo -e "\033[32m[5]\033[0m ustc"

Q2() {
  echo -e "Which mirror you want to use? (1/2/3/4)[1]: \c"
  read ans
  case $ans in
    1|"")
      ans=1
      echo -e "You choose \033[45;37m${mirrors[$ans-1]}\033[0m"
      ;;
    2|3|4|5)
      echo -e "You choose \033[45;37m${mirrors[$ans-1]}\033[0m"
      ;;
    *)
      Q2
      ;;
  esac
  mirror=${mirrors[$ans-1]}
  url="https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/sourcelist-switcher/sources/$path/$mirror.txt"
  echo -e "Downding $url"

  file="/etc/apt/sources.list"
  wget -q -O "$file.tmp" $url;
  if [ ! -f "$file.tmp" ]; then
    echo -e "\033[31m[Error] File not found.\033[0m"
    exit 1
  fi
  mv "$file" "$file.backup";
  mv "$file.tmp" "$file";

  echo -e "Successfully replace /etc/apt/sources.list"
}
Q2

# Step 3: Execute apt update.
echo -e "\r\n\e[36mStep 3. Execute apt update."
apt update