#!/bin/bash -e

install -m 644 files/jessie-backports.list ${ROOTFS_DIR}/etc/apt/sources.list.d/
install -m 644 files/jessie-backports ${ROOTFS_DIR}/etc/apt/preferences.d/

on_chroot apt-key add - < files/debian1.gpg.key
on_chroot apt-key add - < files/debian2.gpg.key
on_chroot << EOF
apt-get update
EOF
