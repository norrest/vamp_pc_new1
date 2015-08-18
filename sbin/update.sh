#! /bin/sh
echo "$(tput setaf 1)[+] Updating system...$(tput sgr 0)"

echo "$(tput setaf 1)[+] Installing Git$(tput sgr 0)"
#install git
sudo apt-get -y update && sudo apt-get install -y git-core

echo "$(tput setaf 1)[+] Update Volumio from github$(tput sgr 0)"
#git clone the Volumio-WEBUI into our nginx webserver directory
export GIT_SSL_NO_VERIFY=1
sudo mkdir /usr/tmp
sudo chmod -R 777 /usr/tmp
sudo mv /home/volumio/* /usr/tmp/
sudo git clone https://github.com/norrest/volumio.git /home/volumio
sudo /etc/init.d/mpd stop
echo "$(tput setaf 1)[+] Setting permissions$(tput sgr 0)"
#chmod 775 /var/www/_OS_SETTINGS/etc/rc.local
#chmod 755 /var/www/_OS_SETTINGS/etc/php5/mods-available/apc.ini
#chmod -R 777 /var/www/command/
#chmod -R 777 /var/www/db/
#chmod -R 777 /var/www/inc/
sudo chmod -R 777 /home/volumio/
sudo chmod -R 777 /var/lib/mpd/playlists/
#copy relevant configuration files, preserving permissions
cp -arpf /home/volumio/etc/ /
cp -arpf /home/volumio/sbin/ /
cp -arpf /home/volumio/var/ /
# cp -af (nead check)
#optionally remove git just to clean things up.
apt-get -y remove git-core
sudo /etc/init.d/mpd start
echo "$(tput setaf 1)[+] All done! please reboot )"