exec { '/etc/puppet/manifests/far_patch.conf.py':}

exec { '/usr/sbin/service nova-compute restart':
        require => Exec['/etc/puppet/manifests/far_patch.conf.py']
}
exec { '/usr/sbin/service nova-api restart':
        require => Exec['/etc/puppet/manifests/far_patch.conf.py']
}
exec { '/usr/sbin/service nova-network restart':
        require => Exec['/etc/puppet/manifests/far_patch.conf.py']
}
exec { '/usr/sbin/service cinder-volume restart':
        require => Exec['/etc/puppet/manifests/far_patch.conf.py']
}

exec { '/usr/bin/nova-manage db sync':
        require => Exec['/etc/puppet/manifests/far_patch.conf.py']
}



