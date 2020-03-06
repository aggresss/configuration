#!/usr/bin/env bash
# ubuntu bionic configuration file
# Normal installation and Install third-party software.
# wget https://raw.githubusercontent.com/aggresss/dotfiles/master/ubuntu/bionic.sh

#########################
# install necessary application
#########################
sudo apt-get update && sudo apt-get install -y \
    apt-file \
    trash-cli \
    alsa-utils \
    mc \
    tree \
    curl \
    jq \
    zsh \
    emacs \
    vim \
    ctags \
    cscope \
    ssh \
    mosh \
    git \
    p7zip-full \
    unrar \
    hexedit \
    tmux \
    expect \
    build-essential \
    gcc-multilib \
    automake \
    ninja-build \
    libtool \
    libtool-bin \
    cmake \
    cmake-curses-gui \
    ccache \
    python-dev \
    python3-dev \
    virtualenv \
    pkg-config \
    flex \
    bison \
    nasm \
    yasm \
    gawk \
    net-tools \
    wireless-tools \
    samba \
    smbclient \
    cifs-utils \
    netcat \
    socat \
    nfs-kernel-server \
    shadowsocks \
    polipo \
    exfat-utils \
    ffmpeg \
    cpu-checker \
    htop \
    nmon \
    bmon \
    sysstat \
    supervisor \
    stow \
    minicom \
    lcov \
    systemtap \
    valgrind \
    oprofile \
    lttng-tools \
    linux-tools-generic \
    linux-tools-common \
    imagemagick \
    doxygen \
    mtp-tools \
    jmtpfs \
    gettext \
    autopoint \
    nodejs \
    libssl-dev \
    libproxy-dev \
    libxml2-dev \
    vpnc-scripts

sudo apt-get update && sudo apt-get install -y \
    default-jdk \
    gnome \
    fonts-dejavu \
    fonts-wqy-microhei \
    fonts-wqy-zenhei \
    x11-apps \
    xinput \
    xclip \
    xbacklight \
    xkbset \
    xdotool \
    vlc \
    pavucontrol \
    chromium-browser \
    slock \
    okular \
    xvnc4viewer \
    remmina \
    flashplugin-installer \
    scrot \
    imagemagick \
    meld \
    xterm \
    fcitx-libpinyin \
    fcitx-sunpinyin \
    fcitx-ui-light \
    gnome-tweak-tool \
    gnome-screensaver \
    libnotify-bin \
    awesome \
    i3 \
    i3status \
    xmonad \
    xmobar \
    dwm \
    gimp \
    valkyrie \
    gpicview \
    cmake-gui \
    graphviz \
    kcachegrind \
    doxygen-gui \
    virt-manager \
    qemu \
    wireshark

