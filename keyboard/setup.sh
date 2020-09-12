## Add the custom layout to the "NO" xkb layout file
echo "- Create custom keybaord map"
sudo ln -s $(echo pwd)/no_mac_custom.xkb /usr/share/X11/xkb/symbols/no_mac_custom

echo "- Linking keyboardmap.service -> /etc/systemd/system/"
sudo ln -s $(echo pwd)/keyboardmap.service /etc/systemd/system/

echo "- Linking keyboardmap.service.d -> /etc/systemd/system/"
sudo ln -s $(echo pwd)/keyboardmap.service.d /etc/systemd/system/

#ln -s ./xhost.sh /etc/lightdm/lightdm.conf.d/xhost.sh
#ln -s ./xhost-enable.conf /etc/lightdm/lightdm.conf.d/xhost-enable.conf
