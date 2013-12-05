class aptrepos::zabbix (
    $server = $aptrepos::params::server_default,
    $platformversion = $aptrepos::params::platformversion_default,
    $keyserver = $aptrepos::params::keyserver_default
) inherits aptrepos::params {
    require aptrepos

    apt::source { 'zabbix':
        location    => "http://${server}/${platformversion}/zabbix/",
        release     => "${lsbdistcodename}",
        repos       => 'main',
        include_src => true,
        key         => '79EA5ED4',
        key_server  => "${keyserver}",
    } ->
    Package <| |>

}
