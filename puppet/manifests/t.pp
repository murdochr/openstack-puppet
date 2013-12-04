exec { '/etc/puppet/manifests/fap_lvm.conf.py': require => Package['lvm2'] }


