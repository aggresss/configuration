#########################
# configuration
#########################

# backlight
sudo touch /usr/share/X11/xorg.conf.d/20-intel.conf
sudo chown ${USER} /usr/share/X11/xorg.conf.d/20-intel.conf
sudo cat << END > /usr/share/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier  "card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
    Option      "AccelMethod" "sna"
    Option      "TearFree" "true"
    Option      "DRI" "3"
    BusID       "PCI:0:2:0"
EndSection

END
sudo chown `id -nu 0` /usr/share/X11/xorg.conf.d/20-intel.conf

# gdm3
sudo sed -r -e 's/^(\[security\])/\1\nDisallowTCP=false/' -i /etc/gdm3/custom.conf

# fcitx
sudo fcitx-autostart

# fix: A stop job is runing ...
sudo sed -r -e 's/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=10s/' -i /etc/systemd/system.conf
sudo sed -r -e 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/' -i /etc/systemd/system.conf
sudo systemctl daemon-reload

# disable apport
sudo sed -r -e 's/enabled=1/enabled=0/' -i /etc/default/apport
sudo systemctl daemon-reload

# GRUB
# save the last choice
sudo sed -r -e 's/^GRUB_DEFAULT.*$/GRUB_DEFAULT=saved\nGRUB_SAVEDEFAULT=true/' -i /etc/default/grub
# remove the splash screen on shutdown an startup
sudo sed -r -e 's/(^GRUB_CMDLINE_LINUX_DEFAULT.*$)/#\1/' -i /etc/default/grub
sudo update-grub

# dnsmasq
# config dnsmasq for polipo use
if [ -f /etc/dnsmasq.conf ]; then
    sudo sed -r -e 's/^#(port=5353)/\1/' -i /etc/dnsmasq.conf
fi

# polipo
# see /usr/share/doc/polipo/examples/config.sample
sudo chown ${USER} /etc/polipo/config
cat << END >> /etc/polipo/config

proxyAddress = "0.0.0.0"
socksParentProxy = "127.0.0.1:1080"
socksProxyType = socks5
proxyPort = 8123
allowedClients = 127.0.0.1, 172.17.0.0/16
chunkHighMark = 50331648
objectHighMark = 16384

END
sudo chown `id -nu 0` /etc/polipo/config

# shadowsocks
# modify shadowsock mode from server to client
sudo sed -r -e 's@DAEMON=/usr/bin/ssserver@DAEMON=/usr/bin/sslocal@' -i /etc/init.d/shadowsocks

# python pip
curl https://bootstrap.pypa.io/get-pip.py -sSf | sudo python
curl https://bootstrap.pypa.io/get-pip.py -sSf | sudo python3

mkdir -p ${HOME}/.pip
cat << END > ${HOME}/.pip/pip.conf
[global]
index-url = https://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host = mirrors.aliyun.com

END

# Rust
curl https://sh.rustup.rs -sSf | sh

# EOF
