#!/bin/bash

#First we are going to make a 4GB swapfile since there is no reliable way to get memory info
printf "Creating Swapfile"
sudo dd if=/dev/zero of=/koreswapfile bs=4096 count=1048576 > /dev/null 2>&1
printf "."
sudo chmod 600 /koreswapfile > /dev/null 2>&1
printf "."
sudo mkswap /koreswapfile > /dev/null 2>&1
printf "."
sudo swapon /koreswapfile > /dev/null 2>&1

#Next we need to installl dependencies
printf "done\nDownloading Dependencies"
sudo apt-get update  > /dev/null 2>&1
printf "."
sudo apt-get install -y software-properties-common  > /dev/null 2>&1
printf "."
sudo add-apt-repository -y ppa:bitcoin/bitcoin  > /dev/null 2>&1
printf "."
sudo apt-get update  > /dev/null 2>&1
printf "."
sudo apt-get install -y autotools-dev autoconf automake build-essential bsdmainutils  > /dev/null 2>&1
printf "."
sudo apt-get install -y libssl-dev libevent-dev libboost-all-dev libcurl4-openssl-dev  > /dev/null 2>&1
printf "."
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev libzmq3-dev  > /dev/null 2>&1
printf "."
sudo apt-get install -y libtool pkg-config protobuf-compiler python3 qttools5-dev  > /dev/null 2>&1
printf "."
sudo apt-get install -y qttools5-dev-tools libprotobuf-dev libqrencode-dev git curl jq  > /dev/null 2>&1

printf "done\nCloning KORE Testnet repository."

#After that we will clone the repository
if [ ! -d kore ];
then
    git clone https://github.com/kore-core/kore.git -q --branch v13
    printf "..done\nCloned to %s" $(pwd)/kore
else
    mkdir kore-testnet && cd kore-testnet
    git clone https://github.com/kore-core/kore.git -q --branch v13
    printf "..done\nCloned to %s" $(pwd)/kore
fi


cd kore/depends
make
cd ..
./autogen.sh
./configure --with-gui=qt5 --prefix=$(pwd)/depends/x86_64-pc-linux-gnu

make


#time to remove the swapfile
sudo swapoff -v /koreswapfile
sudo rm /koreswapfile

clear
echo finished
