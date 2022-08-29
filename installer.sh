#!/bin/bash
apt update
apt full-upgrade -y
tasksel install desktop gnome-desktop
apt remove gnome-games -y
apt install --no-install-recommends sudo adduser -y
/usr/sbin/addgroup --system console
/usr/sbin/adduser user console
apt install --no-install-recommends curl -y
curl --tlsv1.3 --proto =https --max-time 180 --output ~/derivative.asc https://www.kicksecure.com/derivative.asc
cp ~/derivative.asc /usr/share/keyrings/derivative.asc
apt install apt-transport-tor -y
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] tor+http://deb.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion bullseye main contrib non-free" | tee /etc/apt/sources.list.d/derivative.list
apt update
apt full-upgrade -y
apt install --no-install-recommends kicksecure-cli -y
mv /etc/apt/sources.list ~/
touch /etc/apt/sources.list
# tasksel install laptop
systemctl set-default graphical