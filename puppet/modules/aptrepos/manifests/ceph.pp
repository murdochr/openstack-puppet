class aptrepos::ceph (
    $server = $aptrepos::params::server_default,
    $platformversion = $aptrepos::params::platformversion_default,
    $keyserver = $aptrepos::params::keyserver_default
) inherits aptrepos::params {
    require aptrepos

    apt::source { 'ceph':
        location    => "http://${server}/${platformversion}/ceph/",
        release     => "${lsbdistcodename}",
        repos       => 'main',
        include_src => true,
        key         => '17ED316D',
        key_server  => "${keyserver}",
    } ->
    Package <| |>

}
