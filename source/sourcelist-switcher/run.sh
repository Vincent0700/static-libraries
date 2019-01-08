#!/bin/bash
set -e

isDev=false

basePath=$(cd `dirname $0`; pwd)
reposUrl="https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/sourcelist-switcher"

libs=(
    "libs/inquirer/list-input.sh"
)

os_versions=(
    "ubuntu_14.04_trusty"
    "ubuntu_16.04_xenial"
    "ubuntu_18.04_bionic"
)
paths=(
    "sources/ubuntu/trusty" 
    "sources/ubuntu/xenial" 
    "sources/ubuntu/bionic"
)
mirrors=(
    "aliyun" 
    "official" 
    "163" 
    "tsinghua" 
    "ustc"
)

for libpath in ${libs[@]}; do
    if [ "$isDev" = true ]; then
        source $basePath/$libpath
    else
        wget -q -O tmp.sh $reposUrl/$libpath
        source tmp.sh
        rm tmp.sh
    fi
done

function IndexOf() {
    params=($@)
    element=$1
    arr=($@)
    unset arr[0]
    arr=("${arr[@]}")

    for i in "${!arr[@]}"; do 
        item=${arr[$i]}
        if [ "$item" = "$element" ]; then
            echo $i
            return
        fi
    done
    echo -1
}

echo "[Sourcelist Switcher] version 1.0.1"
echo "repos: https://github.com/Vincent0700/static-libraries/tree/master/source/sourcelist-switcher"
echo ""

list_input "Choose your OS version." os_versions selected
selected_os_version=$(IndexOf "$selected" "${os_versions[@]}")

list_input "Choose your OS version." mirrors selected
selected_mirror=$(IndexOf "$selected" "${mirrors[@]}")

url="$reposUrl/${paths[$selected_os_version]}/${mirrors[$selected_mirror]}.txt"
file="/etc/apt/sources.list"

wget -q -O $file $url;

apt update