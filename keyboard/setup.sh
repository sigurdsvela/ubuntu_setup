## Add the custom layout to the "NO" xkb layout file
echo "- Create custom keybaord map"
sudo ln -s $(pwd)/keyboard/no_mac_custom.symbol /usr/share/X11/xkb/symbols/no_mac_custom


echo "- Install xkeysnail(used for mapping)"
sudo pip3 install xkeysnail

echo "- Link default keyboard config"
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo ln -s $(pwd)/keyboard/keyboard.config /etc/default/keyboard

echo "- Linking keyboardmap.service -> /etc/systemd/system/"
sudo ln -s $(pwd)/keyboard/keyboardmap.service /etc/systemd/system/

echo "- Linking keyboardmap.service.d -> /etc/systemd/system/"
sudo ln -s $(pwd)/keyboard/keyboardmap.service.d /etc/systemd/system/

# Realod and start service, happens on boot via .startup.d scripts
sudo systemctl daemon-reload
sudo service keyboardmap start

#ln -s ./xhost.sh /etc/lightdm/lightdm.conf.d/xhost.sh
#ln -s ./xhost-enable.conf /etc/lightdm/lightdm.conf.d/xhost-enable.conf
