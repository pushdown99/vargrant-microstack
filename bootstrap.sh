#!/bin/bash
# https://medium.com/btech-engineering/install-openstack-aio-with-kolla-ansible-in-ubuntu-2b98fc9de4ce

parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary ext4 0% 100%
udevadm settle

pvcreate /dev/sdb1
vgcreate cinder-volumes /dev/sdb1
lvcreate -l 100%FREE -n cinder-volumes-lv cinder-volumes

growpart /dev/sda 3
pvresize /dev/sda3
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv -r

sudo apt update
sudo apt install -y python3-dev libffi-dev gcc libssl-dev python3-venv python3-pip net-tools
sudo apt install -y --reinstall ca-certificates