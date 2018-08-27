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
#get wallet files
wget https://github.com/telostia/lunarium-guides/raw/master/wallet/linux/lunarium-linux.tar.gz
tar -xvf lunarium-linux.tar.gz
rm lunarium-linux.tar.gz vetani_auto.sh
chmod +x lunarium*
cp lunarium* /usr/local/bin
ufw allow 44071/tcp

#masternode input

echo -e "${GREEN}Now paste your Masternode key by using right mouse click and press ENTER ${NONE}";
read MNKEY

EXTIP=`curl -s4 icanhazip.com`
USER=`pwgen -1 20 -n`
PASSW=`pwgen -1 20 -n`

echo -e "${GREEN}Preparing config file ${NONE}";

rm -rf $HOME/.lunarium
sudo mkdir $HOME/.lunarium

printf "rpcuser=lunarium$USER\nrpcpassword=$PASSW\nrpcport=44072\nrpcallowip=127.0.0.1\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=256\nexternalip=$EXTIP:44071\nmasternode=1\nmasternodeprivkey=$MNKEY" >  $HOME/.lunarium/lunarium.conf


lunariumd
watch lunarium-cli getinfo

