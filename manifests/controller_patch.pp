exec { '/etc/puppet/manifests/far_controller_patch.conf.py':}

exec { '/usr/sbin/service apache2 restart':
        require => Exec['/etc/puppet/manifests/far_controller_patch.conf.py']
}
