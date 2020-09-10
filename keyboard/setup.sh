## Add the custom layout to the "NO" xkb layout file
sudo echo "\n\n$(cat ./no_mac_custom.xkb)" >> /usr/share/X11/xkb/symbols/no

sudo ln -s $(pwd)/keyboardmap.service /etc/systemd/system/

sudo mkdir /etc/systemd/system/keyboardmap.service.d 

sudo ln -s $(pwd)/keyboardmap.service.d/keyboardmap.sh /etc/systemd/system/keyboardmap.service.d/
sudo ln -s $(pwd)/keyboardmap.service.d/set_keyboard.sh /etc/systemd/system/keyboardmap.service.d/
sudo ln -s $(pwd)/keyboardmap.service.d/xkeysnail.config.py /etc/systemd/system/keyboardmap.service.d/

ln -s ./xhost.sh /etc/lightdm/lightdm.conf.d/xhost.sh
ln -s ./xhost-enable.conf /etc/lightdm/lightdm.conf.d/xhost-enable.conf
