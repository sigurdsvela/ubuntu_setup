sudo apt install sensors
sudo apt install inxi

cd $(dirname $0)

for f in ./sensors.d/*; do sudo ln -s "`pwd`/$f" /etc/sensors.d/; done

sudo modprobe it87 force_id="0x8620"
sensors-detect --auto
sudo ln -s "`dirname $0`/probe.it87.conf" /etc/modprobe.d/it87.conf
sudo ln -s "`dirname $0`/load.it87.conf" /etc/modules-load.d/it87.conf

cd -

