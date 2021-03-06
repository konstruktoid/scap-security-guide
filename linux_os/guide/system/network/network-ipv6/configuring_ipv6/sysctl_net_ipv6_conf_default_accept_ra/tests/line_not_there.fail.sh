#!/bin/bash

# Clean sysctl config directories
rm -rf /usr/lib/sysctl.d/* /run/sysctl.d/* /etc/sysctl.d/*

sed -i "/net.ipv6.conf.default.accept_ra/d" /etc/sysctl.conf

sysctl -w net.ipv6.conf.default.accept_ra=0
