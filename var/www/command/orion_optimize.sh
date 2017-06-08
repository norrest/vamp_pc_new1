#!/bin/bash
#
#      PlayerUI Copyright (C) 2013 Andrea Coiutti & Simone De Gregori
#		Tsunamp Team
#      http://www.tsunamp.com
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with RaspyFi; see the file COPYING.  If not, see
#  <http://www.gnu.org/licenses/>.
#
#
#	UI-design/JS code by: 	Andrea Coiutti (aka ACX)
#  PHP/JS code by:			Simone De Gregori (aka Orion)
# 
#  file:							player_wdog.sh
#  version:						1.0
#
#
######################################
# Orion Tsunamp Optimize script v0.9 #
######################################
ver="0.9"

if [ "$2" == "startup" ]; then
## kill useless system processes
#killall -9 avahi-daemon
#killall -9 dbus-daemon
killall -9 exim4
killall -9 ntpd
#killall -9 rpc.idmapd
#killall -9 rpc.statd
#killall -9 rpcbind
killall -9 thd
#killall -9 udevd
#killall -9 automount
killall -9 cron
killall -9 atd
#killall -9 dhclient
killall -9 startpar
#Automatic unmuting
sh /home/volumio/unmute.sh
echo "flush startup settings"
fi


##################
# sound profiles #
##################

# default
if [ "$1" == "default" ]; then
echo -n conservative > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
ifconfig eth0 mtu 1500
/etc/init.d/rsyslog stop
echo 0 > /proc/sys/vm/swappiness
echo noop > /sys/block/mmcblk0/queue/scheduler
echo 20 > /proc/sys/vm/dirty_ratio
echo 20 > /proc/sys/vm/dirty_background_ratio # увеличили страничный кеш 
echo "flush DEFAULT sound profile"
fi


## kernel latency settings (1.0 Beta - raspyfi.10betatest.img )
## best settings with previous beta image (raspyfi.10betatest.img) but
## too "cold" sound and less OS stability with current image ( betaacx.img )

# beta1
if [ "$1" == "Eco-Mode" ]; then
echo -n powersave > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
ifconfig eth0 mtu 1500
/etc/init.d/rsyslog stop
echo 0 > /proc/sys/vm/swappiness
echo noop > /sys/block/mmcblk0/queue/scheduler
echo 20 > /proc/sys/vm/dirty_ratio
echo 20 > /proc/sys/vm/dirty_background_ratio # увеличили страничный кеш 
echo "flush Eco-Mod sound profile"
fi

## kernel latency settings (1.0 BetaACX - betaacx.img ) MOD1
## "warm" sound but little less "focus" 


# dev
if [ "$1" == "dev" ]; then
echo "flush DEV sound profile 'fake'"
fi


if [ "$1" == "" ]; then
echo "Orion Optimize Script v$ver" 
echo "Usage: $0 {default|beta1|mod1|mod2} {startup}"
exit 1
fi
