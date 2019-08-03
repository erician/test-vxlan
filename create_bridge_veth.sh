#!/bin/bash
interface="wlx30b49ec633cf"
ip netns add ns1
ip netns add ns2
ip link add veth0 type veth peer name veth1
ip link add veth2 type veth peer name veth3
ip link set veth1 netns ns1
ip link set veth3 netns ns2

brctl addbr br0
brctl addif br0 veth0
brctl addif br0 veth2
#https://serverfault.com/questions/152363/bridging-wlan0-to-eth0
#brctl addif br0 ${interface}

ip link set veth0 up
ip link set veth2 up
ip link set br0 up
ip netns exec ns1 ifconfig veth1 172.18.0.2/24 up
ip netns exec ns2 ifconfig veth3 172.18.0.3/24 up
ip netns exec ns1 ip link set lo up
ip netns exec ns2 ip link set lo up

ip netns exec ns1 route add default dev veth1
ip netns exec ns2 route add default dev veth3

route add -net 172.18.0.0/24 dev br0