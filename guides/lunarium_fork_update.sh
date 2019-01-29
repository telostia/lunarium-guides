#!/bin/bash

cd
#stop the running masternode
lunarium-cli stop
#wait 5secs before continue
sleep 5
#remove old files
sudo rm lunarium*
sudo rm /usr/local/bin/lunarium*

#get wallet files
sudo wget https://github.com/LunariumCoin/lunarium/releases/download/v1.1.0/lunarium-1.1.0-x86_64-linux-gnu.tar.gz
#tar -xvf lunarium-linux.tar.gz
#untar and strip unwanted directories to current folder
sudo chmod +x lunarium-1.1.0-x86_64-linux-gnu.tar.gz
sudo tar --strip-components=2 -zxf lunarium-1.1.0-x86_64-linux-gnu.tar.gz
sudo chmod +x lunarium*
sudo mv lunarium-cli lunariumd /usr/local/bin/
#clean up
sudo rm lunarium*

#pause 1 sec
sleep 1
lunariumd
#wait for bin to load then run
sleep 5
watch lunarium-cli getinfo

