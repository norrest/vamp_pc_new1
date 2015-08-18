echo "$(tput setaf 1)[+] Updating system...$(tput sgr 0)"
echo "$(tput setaf 1)[+] Installing Git$(tput sgr 0)"
#install git
sudo apt-get -y update && sudo apt-get install -y git-core

echo "$(tput setaf 1)[+] Update Volumio from github$(tput sgr 0)"
#git clone the Volumio-WEBUI into our nginx webserver directory
export GIT_SSL_NO_VERIFY=1
sudo mkdir /usr/tmpi
sudo chmod -R 777 /usr/tmpi
sudo git clone https://github.com/norrest/volumio.git /usr/tmpi
sudo /etc/init.d/mpd stop
echo "$(tput setaf 1)[+] Setting permissions$(tput sgr 0)"
sudo chmod -R 777 /usr/tmpi
sudo chmod -R 777 /var/lib/mpd/playlists/
#copy relevant configuration files, preserving permissions
cp -arpf /usr/tmpi/etc/ /
cp -arpf /usr/tmpi/sbin/ /
cp -arpf /usr/tmpi/var/ /
# cp -af (nead check)
#optionally remove git just to clean things up.
sudo apt-get -y remove git-core
sudo /etc/init.d/mpd start
sudo rm -R /usr/tmpi
echo "$(tput setaf 1)[+] All done! please reboot )"