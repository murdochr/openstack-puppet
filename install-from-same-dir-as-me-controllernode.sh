!#/bin/bash
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install puppet -y
#

cp puppet/manifests/* /etc/puppet/manifests


puppet apply --modulepath puppet/modules/ puppet/manifests/prereq.pp
puppet apply --modulepath puppet/modules/ puppet/manifests/prereq.pp

puppet apply --modulepath puppet/modules/ puppet/manifests/oss.pp --certname openstack_controller
puppet apply --modulepath puppet/modules/ puppet/manifests/oss.pp --certname openstack_controller
puppet apply --modulepath puppet/modules/ puppet/manifests/oss.pp --certname openstack_controller

puppet apply --modulepath puppet/modules/ puppet/manifests/controller_patch.pp

