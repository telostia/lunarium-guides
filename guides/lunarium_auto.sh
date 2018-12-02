#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install nano -y
sudo apt-get install curl -y
sudo apt-get install pwgen -y
sudo apt-get install wget -y
sudo apt-get install build-essential libtool automake autoconf -y
sudo apt-get install autotools-dev autoconf pkg-config libssl-dev -y
sudo apt-get install libgmp3-dev libevent-dev bsdmainutils libboost-all-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

cd
#remove old files
sudo rm lunarium*
sudo rm /usr/local/bin/lunarium*

#get wallet files
#wget https://github.com/telostia/lunarium-guides/raw/master/wallet/linux/lunarium-linux.tar.gz
sudo wget https://github.com/LunariumCoin/lunarium/releases/download/v1.0.2/lunarium-1.0.2-x86_64-linux-gnu.tar.gz
#tar -xvf lunarium-linux.tar.gz
#untar and strip unwanted directories to current folder
sudo tar --strip-components=2 -zxf lunarium-1.0.2-x86_64-linux-gnu.tar.gz
sudo chmod +x lunarium*
sudo cp lunarium-cli lunariumd /usr/local/bin/
#clean up
sudo rm lunarium-linux.tar.gz lunarium_auto.sh
sudo rm lunarium-tx lunarium-cli lunariumd lunarium-qt
sudo rm lunarium-1.0.2-x86_64-linux-gnu.tar.gz
sudo ufw allow 44071/tcp

#masternode input

echo -e "${GREEN}Now paste your Masternode key by using right mouse click and press ENTER ${NONE}";
read MNKEY

EXTIP=`curl -s4 icanhazip.com`
USER=`pwgen -1 20 -n`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";

#remove directory if exists
rm -rf $HOME/.lunarium
sudo mkdir $HOME/.lunarium

printf "rpcuser=lunarium$USER\nrpcpassword=$PASSW\nrpcport=44072\nrpcallowip=127.0.0.1\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=56\nexternalip=$EXTIP:44071\nmasternode=1\nmasternodeprivkey=$MNKEY" >  $HOME/.lunarium/lunarium.conf


sleep 1
lunariumd
sleep 5
watch lunarium-cli getinfo

