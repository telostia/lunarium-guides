## Lunarium COIN MN FORK UPDATE GUIDE

### Windows wallet setup

Download fork v1.1.1 windows wallet from these locations:
https://github.com/LunariumCoin/lunarium/releases

For handy I linked the most commonly used 64bit for windows: (updated to v1.0.2)
https://github.com/LunariumCoin/lunarium/releases/download/v1.1.1/lunarium-1.1.1-win64.zip

backup your wallets first by copying the data folder.
Run new wallet and sync it.

Now move on to linux vps setup.

-----------------------
### Linux VPS setup
----------------------

Log into your linux Vps and copy the line below and press enter:

* cd && bash -c "$(wget -O - https://raw.githubusercontent.com/telostia/lunarium-guides/master/guides/lunarium_fork_update.sh)"

when asked to paste genkey. right click to paste your genkey in.



### ---------------------------------
### Windows wallet to add masternode 
### ---------------------------------

1.   Open the Lunarium Desktop Wallet. 
2.   Go to RECEIVE and create a New Address: MN1 
3.   Send 10000 Lunarium to MN1. 
4.   Wait for confirmations. 
5.   Go to Tools -> "Debug console - Console" 
6.   Type the following command: masternode outputs 
7.   Go to ** Tools -> "Open Masternode Configuration File" 
8.   Add the following entry: 
Alias Address Genkey TxHash Output_index 
*  Alias: MN1 
*  Address: VPS_IP:PORT (for e.g 108.5.5.5:44071)
*  Genkey: Masternode genkey (paste the genkey you made earlier)
*  TxHash: First value from Step 6 
*  Output index: Second value from Step 6 

9.   Save and close the file. 
10.   Go to Masternode Tab. If your tab is not shown, please enable it 
from: Settings - Options - Wallet - Show Masternodes Tab 
11.   Click Update status to see your node. If it is not shown, close the wallet and 
start it again. Make sure the wallet is unlocked. 
12.   Open Debug Console and type: 
masternode start-alias [alias] 

**sample for mn1:**
masternode start-alias mn1

Complete! Thank you for using this guide.
If you like this script and find it helpful, can donate me some coins :) 

Presented to you by Blademaster(discord name: blademaster#9743)

**Lunarium(xln)**: LMW6fnRwUr7CbVkGovUUyB2xAroLT6qbMP

**bitcoin(btc)**: 35e29JQfqhPYWShTRYGQkiFedWTn412Y4F

**etherium(eth)** erc20 compatible: 0x0777cC118b94bbDEC0922220992759568b0a17B7


 
