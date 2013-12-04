$pvolume='/dev/sdb'
$vgroup='cinder-volumes'

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

exec { '/etc/puppet/manifests/far_lvm.conf.py': subscribe => Package['lvm2'] }  

#replace with only ifs and some file placements

