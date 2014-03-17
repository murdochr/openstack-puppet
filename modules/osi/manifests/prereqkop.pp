class osi::prereqkop {

    $pvolume='/dev/sdb'
    $vgroup='cinder-volumes'


    class { 'apt':
      always_apt_update    => false,
      disable_keys         => undef,
      proxy_host           => false,
      proxy_port           => '8080',
      purge_sources_list   => false,
      purge_sources_list_d => false,
      purge_preferences_d  => false,
      update_timeout       => 3600
    }


    notify{"${hostname}":}
    notify{"${ipaddress}":}

    host { "${hostname}":
        ensure => 'present',
        target => '/etc/hosts',
        ip => "${ipaddress}",
    }


    package { 'lvm2':
        ensure => 'latest'
    }

    physical_volume { "${pvolume}":
        ensure => present,
    }

    volume_group {  "${vgroup}":
        ensure => present,
        physical_volumes => "${pvolume}"
    }


    file {'binary path-hibu':
        path    => ['/opt/hibu'],
        ensure  => 'directory'
    } 

    file {'binary path-bin':
            path    => ['/opt/hibu/bin'],
                    ensure  => 'directory',
                    require => File['binary path-hibu']
    }

    file {'/opt/hibu/bin/far_lvm.conf.py':
        source      => 'puppet:///modules/osi/far_lvm.conf.py',
        require     => File['binary path-bin']
    }

#    file {'/etc/apt/sources.list.d':
#        source      => 'puppet:///modules/osi/sources.list.d',
#        recurse     =>  true,
#        notify      =>  Exec ["/usr/bin/apt-get -y update"]
#    }


    exec {'/opt/hibu/bin/far_lvm.conf.py':
        subscribe   => Package['lvm2'],
        refreshonly => true,
        require     => File['/opt/hibu/bin/far_lvm.conf.py']
    }
#replace with only ifs and some file placements


    package { 'python-software-properties':
        ensure => 'installed',
    }



    apt::ppa { 'cloud-archive:havana':
       #notify => Exec ["/usr/bin/apt-get -y update"],
       #refreshonly  => true,
       subscribe => exec['/opt/hibu/bin/far_lvm.conf.py'],
       before   => Exec['/usr/bin/apt-get -y update']
    }


    exec { "/usr/bin/apt-get -y update":

      timeout => 3600,
      refreshonly => true,
      subscribe => Exec['/usr/bin/touch /var/lock/aptgetupdate.lck'],
      notify    => Exec['/usr/bin/apt-get -y dist-upgrade']
    }

    exec { '/usr/bin/touch /var/lock/aptgetupdate.lck': 
        creates => '/var/lock/aptgetupdate.lck',
    }



    exec { "/usr/bin/apt-get -y dist-upgrade":
      refreshonly => true,
      timeout => 3600,
    }
}
