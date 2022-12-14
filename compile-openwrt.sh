#!/usr/bin/env bash

# Change these to fit the versions you want to compile
OPENWRT_VERSION='21.02.3'

# Dont change this on dot changes, such as .2 to .3
OPENWRT_PACKAGES_BRANCH='openwrt-21.02'

# These are your packages you want in the build
PACKAGES="firewall iptables docker docker-compose dockerd luci-app-dockerman luci-lib-docker \
            base-files block-mount fdisk luci-app-minidlna minidlna samba4-server \
            samba4-libs luci-app-samba4 wireguard-tools luci-app-wireguard \
            openvpn-openssl luci-app-openvpn watchcat openssh-sftp-client \
            luci-base luci-ssl luci-mod-admin-full luci-theme-bootstrap \
            htop debootstrap luci-compat luci-lib-ipkg dnsmasq luci-app-ttyd"

# Do not change these as they are used by the script
BASEDIR="${PWD}"

# Bash Color mapping
grey='\e[1;30m'
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
white='\e[0;37m'
WHITE='\e[1;37m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

# Allows us to say things using colors so its easy to see in the console
say() {
    echo -e "${RED}[${yellow}*** ${CYAN}${1} ${yellow}***${RED}]${NC}"
}

# If we have an openwrt directory, we want to start fresh so alert us and exit
[ -d "${BASEDIR}/openwrt" ] && { say "Found existing openwrt directory, deleting it"; rm -rf "${BASEDIR}/openwrt"; }

# Clone openwrt from its git repo and fetch the branch we want to compile
say "Cloning openwrt"
git clone -b "v${OPENWRT_VERSION}" https://git.openwrt.org/openwrt/openwrt.git
cd openwrt

# If we have any patches to install, do it now
say "Installing Patches"
if [ -d "${BASEDIR}/patches" ]; then
    for patch in $(find "${BASEDIR}/patches" -type f -name '*.patch'); do
        say "Applying patch ${patch}"
        patch -p1 < "${patch}"
    done
fi

# Copy in our config and feed
say "Copy our custom config feed and .config"
cp "${BASEDIR}/configs/config.buildinfo" "${BASEDIR}/openwrt/.config"
cp "${BASEDIR}/configs/feeds.buildinfo" "${BASEDIR}/openwrt/feeds.conf"

# Run feed commands pre-build, do this before creating our .config as it did not work when ran after
say "Updating and Installing Feeds"
./scripts/feeds update -a
./scripts/feeds install -a

# Copy in the custom files directory if it exists - this adds our scripts and files to openwrt
[ -d "${BASEDIR}/files" ] && { say "Copying our custom files into openwrt folder"; cp -R "${BASEDIR}/files/" "${BASEDIR}/openwrt/"; } || { say "No files directory found"; exit 1; }

# Write the packages we want to install to the .config
say "Add our requested packages to the .config"
for PACKAGE in ${PACKAGES}; do
    say "Adding ${PACKAGE} to .config"
    echo "CONFIG_PACKAGE_${PACKAGE}=m" >> .config
done

# Generate our final .config for image building
say "Running make defconfig to generate .config"
make defconfig

# Build with full debug if local, otherwise normal build
[ "$(uname -n)" == "ops" ] && { say "Building OpenWRT Full Debug"; make -j$(nproc) V=s; } || { say "Building OpenWRT"; make -j$(nproc); }

