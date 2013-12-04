!#/bin/bash
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get install puppet
#

cp puppet/manifests/* /etc/puppet/manifests


puppet apply --modulepath puppet/modules/ puppet/manifests/prereq.pp
puppet apply --modulepath puppet/modules/ puppet/manifests/prereq.pp

puppet apply --modulepath puppet/modules/ puppet/manifests/oss.pp --certname openstack_compute1
puppet apply --modulepath puppet/modules/ puppet/manifests/oss.pp --certname openstack_compute1
puppet apply --modulepath puppet/modules/ puppet/manifests/oss.pp --certname openstack_compute1

puppet apply --modulepath puppet/modules/ puppet/manifests/patch.pp

