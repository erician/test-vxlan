# test-vxlan
create vxlan in linux with shell commands and test it

# create vxlan in single linux machine
## newwork layout
+-+-+-+-+-+-+-+-
| ns1
|
|   +-+-+-+-+
+-+-|       |-+-
    | veth3 |
  +-|-+-+-+-|-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
  | +-+-+-+-+
  |
  |
## create vxlan with bridge and veth
open create_vxlan, change the interface to your interface name, and run
```shell
$ sudo ./create_vxlan.sh
```
## test vxlan
sudo ip netns exec ns1 ping 172.18.0.3
## delete vxlan
```shell
sudo ip netns del ns1
sudo ip netns del ns2
sudo ip link set br0 down
sudo brctl delbr br0
sudo ip link set vxlan0 down
sudo ip link del vxlan0
```

# create vxlan in two linux machines

## delete vxlan
sudo ip link set br0 down
```shell
sudo ip link set br0 down
sudo brctl delbr br0
sudo ip link set vxlan0 down
sudo ip link del vxlan0
```

# create bridge with veth

## delete
```shell
sudo ip netns del ns1
sudo ip netns del ns2
sudo ip link set br0 down
sudo brctl delbr br0
```