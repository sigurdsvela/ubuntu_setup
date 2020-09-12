# Essentials

## --- pip3 git add-apt-repository
echo "Installing basics"
echo "- git"
sudo apt install git -y 2> /dev/null
echo "- apt-utils"
sudo apt install apt-utils -y 2> /dev/null
echo "- python3"
sudo apt install python3-pip -y 2> /dev/null
echo "- software-properties-common"
sudo apt install software-properties-common -y 2> /dev/null
## --- Add 32bit
sudo dpkg --add-architecture i386


echo "Sensors setup"
./sensor-setup.sh


## ---- Snaps
echo "Installing snaps..."
sudo apt install snap > /dev/null
snap install spotify > /dev/null
snap install --classic code > /dev/null
snap install --classic deja-dup > /dev/null

echo
echo

## ---- Dropbox
echo "Downloading/Installing Dropbox"
sudo wget -O /usr/local/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"

echo
echo

## ---- Keyboard
echo "Setup keyboard"
sudo ./keyboard/setup.sh
echo "Done setting up keyboard"

## Lets do the rest of this in Python, cause I hatee bash
sudo -H pip3 install pyyaml > /dev/null
sudo -H python3 ./setup.py