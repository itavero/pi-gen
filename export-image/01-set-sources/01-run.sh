#!/bin/bash -e

on_chroot << EOF
apt-get update
apt-get -y dist-upgrade
apt-get autoremove
apt-get clean
EOF
