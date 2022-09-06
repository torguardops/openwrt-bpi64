#!/bin/sh
# /etc/udpate.sh PrivateRouter Update Script

# Verify we are connected to the Internet
is_connected() {
    ping -q -c3 1.1.1.1 >/dev/null 2>&1
    return $?
}


[ is_connected ] && {

   echo "updating all packages!"

   echo "                                                                      "
   echo " ███████████             ███                         █████            "
   echo "░░███░░░░░███           ░░░                         ░░███             "
   echo " ░███    ░███ ████████  ████  █████ █████  ██████   ███████    ██████ "
   echo " ░██████████ ░░███░░███░░███ ░░███ ░░███  ░░░░░███ ░░░███░    ███░░███"
   echo " ░███░░░░░░   ░███ ░░░  ░███  ░███  ░███   ███████   ░███    ░███████ "
   echo " ░███         ░███      ░███  ░░███ ███   ███░░███   ░███ ███░███░░░  "
   echo " █████        █████     █████  ░░█████   ░░████████  ░░█████ ░░██████ "
   echo "░░░░░        ░░░░░     ░░░░░    ░░░░░     ░░░░░░░░    ░░░░░   ░░░░░░  "
   echo "                                                                      "
   echo "                                                                      "
   echo " ███████████                        █████                             "
   echo "░░███░░░░░███                      ░░███                              "
   echo " ░███    ░███   ██████  █████ ████ ███████    ██████  ████████        "
   echo " ░██████████   ███░░███░░███ ░███ ░░░███░    ███░░███░░███░░███       "
   echo " ░███░░░░░███ ░███ ░███ ░███ ░███   ░███    ░███████  ░███ ░░░        "
   echo " ░███    ░███ ░███ ░███ ░███ ░███   ░███ ███░███░░░   ░███            "
   echo " █████   █████░░██████  ░░████████  ░░█████ ░░██████  █████           "
   echo "░░░░░   ░░░░░  ░░░░░░    ░░░░░░░░    ░░░░░   ░░░░░░  ░░░░░            "

   opkg update
   #Go Go Packages
    opkg install base-files blockdev busybox ca-bundle ca-certificates cgi-io curl davfs2 dnsmasq dropbear e2fsprogs f2fsck firewall fstools fwtool getrandom hostapd-common ip-full ip6tables ipset iw iwinfo jshn jsonfilter kernel kmod-ata-

   opkg install ahci-mtk kmod-ata-core kmod-bluetooth kmod-btmtkuart kmod-cfg80211 kmod-crypto-aead kmod-crypto-ccm kmod-crypto-cmac kmod-crypto-ctr kmod-crypto-ecb kmod-crypto-ecdh kmod-crypto-gcm kmod-crypto-gf128 kmod-crypto-ghash kmod-crypto-hash kmod-crypto-hmac

   opkg install kmod-crypto-kpp kmod-crypto-lib-blake2s kmod-crypto-lib-chacha20 kmod-crypto-lib-chacha20poly1305 kmod-crypto-lib-curve25519 kmod-crypto-lib-poly1305 kmod-crypto-manager kmod-crypto-null kmod-crypto-rng kmod-crypto-seqiv kmod-crypto-sha256 kmod-

   opkg install fuse kmod-gpio-button-hotplug kmod-hid kmod-hwmon-core kmod-input-core kmod-input-evdev kmod-ip6tables kmod-ipt-conntrack kmod-ipt-core kmod-ipt-ipopt kmod-ipt-ipset kmod-ipt-nat kmod-ipt-offload kmod-leds-gpio kmod-lib-crc-ccitt kmod-lib-crc16 kmod-

   opkg install mac80211 kmod-mt76-connac kmod-mt76-core kmod-mt7615-common kmod-mt7615-firmware kmod-mt7615e kmod-nf-conntrack kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject kmod-nf-reject6 kmod-nfnetlink kmod-nls-base kmod-ppp

   opkg install kmod-pppoe kmod-pppox kmod-regmap-core kmod-scsi-core kmod-slhc kmod-tun kmod-udptunnel4 kmod-udptunnel6 kmod-usb-core kmod-usb-xhci-hcd kmod-usb3 kmod-wireguard libblkid1 libblobmsg-json20210819 libbpf0 libbz2-1.0 libc libcomerr0 libcurl4 libelf1

   opkg install libevent2-7 libexif libexpat libext2fs2 libf2fs6 libffmpeg-mini libflac libfuse1 libgcc1 libid3tag libip4tc2 libip6tc2 libipset13 libiwinfo-data libiwinfo-lua libiwinfo20210430 libjpeg-turbo libjson-c5 libjson-script20210819 liblua5.1.5 liblucihttp-lua

   opkg install liblucihttp0 liblzo2 libmnl0 libneon libnghttp2-14 libnl-tiny1 libogg0 libopenssl1.1 libowipcalc libpthread librt libsqlite3-0 libss2 libubox20210819 libubus-lua libubus20210630 libuci20130104 libuclient20201210 libunbound libuuid1 libvorbis

   opkg install libxtables12 logd lua luci luci-app-firewall luci-app-minidlna luci-app-openvpn luci-app-opkg luci-app-unbound luci-app-wireguard luci-base luci-compat luci-i18n-wireguard-en luci-lib-base luci-lib-ip luci-lib-ipkg luci-lib-jsonc luci-lib-nixio luci-mod-

   opkg install admin-full luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp luci-proto-wireguard luci-theme-bootstrap luci-theme-openwrt-2020 minidlna mkf2fs mt7622bt-firmware mtd netifd odhcp6c odhcpd-ipv6only openssh-sftp-server

   opkg install openvpn-openssl openwrt-keyring opkg owipcalc ppp ppp-mod-pppoe procd resolveip rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci rpcd-mod-rrdns ubi-utils uboot-envtools ubox ubus ubusd uci uclient-fetch uhttpd uhttpd-mod-ubus unbound-daemon urandom-seed

   opkg install urngd usign wg-installer-client wireguard-tools wireless-regdb zlib zlib kmod-usb-storage block-mount luci-app-minidlna kmod-fs-ext4 kmod-fs-exfat fdisk

   opkg install wireguard-tools wireless-regdb wpad zlib kmod-usb-storage block-mount samba4-server luci-app-samba4 luci-app-minidlna minidlna kmod-fs-ext4 kmod-fs-exfat e2fsprogs fdisk libc btrfsprogs cacertificates containerd
   opkg install libdevmapper libnetwork tini libseccomp iptablesmodextra kmodbrnetfilter kmodikconfig kmodnfconntracknetlink kmodnfipvs kmodnfnat kmodveth
   echo "Installing TorGuard Wireguard..."
   opkg install /etc/luci-app-tgwireguard_1.0.1-1_all.ipk

   echo "PrivateRouter update complete!"

   exit 0
} || exit 1
