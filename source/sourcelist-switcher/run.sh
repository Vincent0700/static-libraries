#!/bin/bash
set -e

version=1.0.2
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
    "ubuntu_arm_16.04_xenial"
)
paths=(
    "sources/ubuntu/trusty" 
    "sources/ubuntu/xenial" 
    "sources/ubuntu/bionic"
    "sources/ubuntu-arm/xenial"
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

echo ""
echo "[Sourcelist Switcher] version $version"
echo "repos: https://github.com/Vincent0700/static-libraries/tree/master/source/sourcelist-switcher"
echo ""

list_input "Choose your OS version." os_versions selected
selected_os_version=$(IndexOf "$selected" "${os_versions[@]}")

if [ "$selected" = "ubuntu_arm_16.04_xenial" ]; then
    mirrors=(
        "official"
        "tsinghua"
        "ustc"
    )
fi

list_input "Choose mirror site." mirrors selected
selected_mirror=$(IndexOf "$selected" "${mirrors[@]}")

url="$reposUrl/${paths[$selected_os_version]}/${mirrors[$selected_mirror]}.txt"
file="/etc/apt/sources.list"

echo ""
echo "Downloading from $url"
wget -q -O $file $url;

echo ""
echo "Update sourcelist"

echo ""
apt update