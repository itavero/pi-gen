#!/bin/bash -e

install -v -d						${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d
install -v -m 644 files/wait.conf			${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/

install -v -d                                           ${ROOTFS_DIR}/etc/wpa_supplicant
install -v -m 600 files/wpa_supplicant.conf             ${ROOTFS_DIR}/etc/wpa_supplicant/

install -m 644 files/dhcpd.conf ${ROOTFS_DIR}/etc/dhcp/dhcpd.conf
install -m 644 files/isc-dhcp-server ${ROOTFS_DIR}/etc/default/isc-dhcp-server

install -m 755 files/fqdn_hostname			${ROOTFS_DIR}/etc/init.d/

rm -f ${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf

on_chroot << EOF
systemctl enable fqdn_hostname
EOF
