# Essentials

## --- pip3 git add-apt-repository
sudo apt install git python3-pip software-properties-common -y
## --- Add 32bit
sudo dpkg --add-architecture i386

## --- pyyaml
pip3 install pyyaml


## ---- Snaps
echo "Installing snaps..."
sudo apt install snap > /dev/null
snap install spotify > /dev/null
snap install --classic code > /dev/null
snap install --classic deja-dup > /dev/null

echo
echo

## ---- Dropbox
echo "Installing Dropbox:"
echo "- Downloading..."
curl https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb -o db.deb > /dev/null
echo "- Installing..."
sudo apt install ./db.deb
echo "- Cleanup..."
rm db.deb

echo
echo

## ---- Keyboard
echo "Setup keyboard"
sudo ./keyboard/setup.sh
echo "done"

## Lets do the rest of this in Python, cause I hatee bash
sudo -H $HOME python3 ./setup.py