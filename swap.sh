#!/bin/bash
mkdir /swap
cd /swap
dd if=/dev/zero of=swapfile bs=1M count=8912
chmod 0600 swapfile
mkswap swapfile
swapon swapfile
free -m
