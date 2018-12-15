#!/usr/bin/env bash

echo -e "\e[36m*************************************************\033[0m"
echo -e "\e[36m*              Sourcelist Switcher              *\033[0m"
echo -e "\e[36m*  @auther: wang.yuanqiu007@gmail.com           *\033[0m"
echo -e "\e[36m*  @github: https://github.com/vincent0700      *\033[0m"
echo -e "\e[36m*************************************************\033[0m"

# Step 1: Collecting system version.
echo -e "\r\n\e[36mStep 1. Select your system version.\033[0m"
versions=("xenial" "boinc" )
paths=("ubuntu/xenial" "ubuntu/boinc")

echo -e "\033[32m[1]\033[0m ubuntu 16.04 xenial (default)"
echo -e "\033[32m[2]\033[0m ubuntu 18.04 boinc"

Q1() {
  echo -e "Which version is your system? (1/2)[1]: \c"
  read ans
  case $ans in
    1|"")
      ans=1
      echo "You choose ${versions[$ans-1]}"
      ;;
    2)
      echo "You choose ${versions[$ans-1]}"
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
echo -e "\033[32m[4]\033[0m ustc"

Q2() {
  echo -e "Which mirror you want to use? (1/2/3/4)[1]: \c"
  read ans
  case $ans in
    1|"")
      ans=1
      echo "You choose ${mirrors[$ans-1]}"
      ;;
    2|3|4|5)
      echo "You choose ${mirrors[$ans-1]}"
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
  echo -e "The old version has been moved to /etc/apt/sources.list.back"
}
Q2

# Step 3: Execute apt update.
echo -e "\r\n\e[36mStep 3. Execute apt update."
apt update