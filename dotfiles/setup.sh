## -- SSH -- ##
for f in ./.ssh/*; do ln -s $(pwd)/dotfiles/$f ~/.ssh; done

## -- STARTUP.D -- ##
ln -s $(pwd)/dotfiles/.startup.d ~/

## -- PROFILE.D -- ##
# Run all .profile.d .sh files on .bashrc
printf "\n\nfor f in ~/.profile.d/*.sh; do source \"\$f\"; done \n" >> ~/.bashrc
ln -s $(pwd)/dotfiles/.profile.d ~/
source ~/.bashrc

