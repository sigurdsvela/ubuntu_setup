## -- SSH -- ##
for f in ./.ssh/*; do ln -s $(pwd)/dotfiles/$f ~/.ssh; done

## -- STARTUP.D -- ##
ln -s $(pwd)/dotfiles/.startup.d ~/ # Initiated by the startup.sh.desktop script in ~/.config/autostart

## -- XKB.d -- ##
ln -s $(pwd)/dotfiles/.xkb.d ~/

## -- .config/autostart -- ##
# Starts the .startup scripts
mkdir -p ~/.config/autostart &> /dev/null
ln -s $(pwd)/dotfiles/.config/autostart/startup.sh.desktop ~/.config/autostart/

## -- PROFILE.D -- ##
# Run all .profile.d .sh files on .bashrc
printf "\n\nfor f in ~/.profile.d/*.sh; do source \"\$f\"; done \n" >> ~/.bashrc
ln -s $(pwd)/dotfiles/.profile.d ~/
source ~/.bashrc

