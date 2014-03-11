class osi::prereq {

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

    exec { '/etc/puppet/manifests/far_lvm.conf.py':
        subscribe => Package['lvm2'],
        refreshonly => true }

#replace with only ifs and some file placements


    package { 'python-software-properties':
        ensure => 'installed',
    }

#file { '/etc/apt/sources.list.d':
#}


    apt::ppa { 'cloud-archive:havana':
       notify => Exec ["/usr/bin/apt-get -y update"]
    }


    exec { "/usr/bin/apt-get -y update":
      #refreshonly => true,
      timeout => 3600,
     # subscribe => Apt:Ppa['cloud-archive:havana']
    }



    exec { "/usr/bin/apt-get -y dist-upgrade":
      #refreshonly => true,
      timeout => 3600,
      subscribe => Exec[ "/usr/bin/apt-get -y update"]
    }
}
