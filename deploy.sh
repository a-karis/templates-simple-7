#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
template_base_dir="$DIR"

ntpserver=10.5.26.10  #RH LAB

#openstack overcloud deploy --templates \
#-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
#-e ${template_base_dir}/network-environment.yaml \
#--control-flavor control --compute-flavor compute \
#--control-scale 3 --compute-scale 2 --ceph-storage-scale 0 \
#--ntp-server $ntpserver \
#--neutron-network-type vxlan --neutron-tunnel-types vxlan 

openstack overcloud deploy --templates \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e ${template_base_dir}/network-environment.yaml \
--control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
--control-scale 3 --compute-scale 2 --ceph-storage-scale 0 \
--ntp-server $ntpserver \
--neutron-network-type vxlan --neutron-tunnel-types vxlan
#-e ${template_base_dir}/storage-environment.yaml \
