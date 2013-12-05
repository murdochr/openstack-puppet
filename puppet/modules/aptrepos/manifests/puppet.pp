class aptrepos::puppet (
    $server = $aptrepos::params::server_default,
    $platformversion = $aptrepos::params::platformversion_default,
    $keyserver = $aptrepos::params::keyserver_default
) inherits aptrepos::params {
    require aptrepos

    apt::source { 'puppet':
        location    => "http://${server}/${platformversion}/puppet/",
        release     => "${lsbdistcodename}",
        repos       => 'main dependencies',
        include_src => true,
        key         => '4BD6EC30',
        key_server  => "${keyserver}",
    } ->
    apt::pin { 'puppet_3_2_4':
        packages         => 'puppet*',
        priority        => 900,
        version => '3.2.4-1puppetlabs1',
    } ->
    Package <| |>
    
}
