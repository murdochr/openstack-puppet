class osi::unittest {

#    file {'binary path-hibu':
#        path    => ['/opt/hibu'],
#        ensure  => 'directory'
#    } 

#    file {'binary path-bin':
#            path    => ['/opt/hibu/bin'],
#                    ensure  => 'directory',
#                    require => File['binary path-hibu']
#    }

    file {'/opt/hibu/bin/papi.py':
        source      => 'puppet:///modules/osi/papi.py',
        require     => File['/opt/hibu/bin/cirros-0.3.0-x86_64-disk.img']
    }

    file {'/opt/hibu/bin/cirros-0.3.0-x86_64-disk.img':
        source      => 'puppet:///modules/osi/cirros-0.3.0-x86_64-disk.img',
    }



    exec {'/opt/hibu/bin/papi.py':
      #  subscribe   => Package[''],
      #  refreshonly => true,
        require     => File['/opt/hibu/bin/papi.py']
    }


}


