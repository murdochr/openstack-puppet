class aptrepos::openstack (
    $server = $aptrepos::params::server_default,
    $platformversion = $aptrepos::params::platformversion_default
) inherits aptrepos::params {
    require aptrepos

    apt::source { 'ubuntu_openstack':
        location    => "http://${server}/${platformversion}/openstack/",
        release     => "${lsbdistcodename}-updates/havana",
        repos       => 'main',
        include_src => true,
        key         => 'EC4926EA',
        key_server  => "${keyserver}",
    } ->
    Package <| |>
}
