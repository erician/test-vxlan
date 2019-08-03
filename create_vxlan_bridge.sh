#!/bin/bash
interface="wlx30b49ec633cf"
brctl addbr br0
ip link add vxlan0 type vxlan id 100 dstport 4789 dev ${interface}
brctl addif br0 vxlan0
ip link set br0 up
ip link set vxlan0 up