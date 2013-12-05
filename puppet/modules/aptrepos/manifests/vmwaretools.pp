class aptrepos::vmwaretools (
    $server = $aptrepos::params::server_default,
    $platformversion = $aptrepos::params::platformversion_default,
    $keyserver = $aptrepos::params::keyserver_default
) inherits aptrepos::params {
    require aptrepos

    apt::source { 'vmwaretools':
        location    => "http://${server}/${platformversion}/vmwaretools/",
        release     => "${lsbdistcodename}",
        repos       => 'main',
        include_src => false,
        key         => '66FD4949',
        key_server  => "${keyserver}",
    } ->
    Package <| |>
    
}
