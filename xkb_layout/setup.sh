## Add the custom layout to the "NO" xkb layout file
sudo echo "\n\n$(cat ./no_mac_custom)" >> /usr/share/X11/xkb/symbols/no

## Change the default layout keyboard file
sudo cp ./default_keyboard /etc/defaults/keyboard