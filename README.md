openstack-puppet
================

This is a prelim package to install openstack via puppet.

It is using: http://forge.puppetlabs.com/puppetlabs/openstack as its base

It uses these puppet forge upsteam modules:


puppet module install puppetlabs/lvm
puppet module install puppetlabs/apt

---


puppet/manifests/far_lvm.conf.py makes the assumption /dev/sda and /dev/sdb are used.


puppet/manifests/far_patch.conf.py makes the assumption 172.30.0.24 is the controller.

puppet/manifests/prereq.pp uses:


$pvolume='/dev/sdb'
$vgroup='cinder-volumes'


puppet/manifests/oss.pp uses eth0 as public and eth1 as private and uses 172.30.0.24 as controller.
