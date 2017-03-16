mkdir -p ${ROOTFS_DIR}/opt/deb/

install -m 644 files/avrdude_6.3_armhf.deb ${ROOTFS_DIR}/opt/deb/

on_chroot << EOF
dpkg -i /opt/deb/avrdude_6.3_armhf.deb
rm -f /opt/deb/avrdude_6.3_armhf.deb
EOF
