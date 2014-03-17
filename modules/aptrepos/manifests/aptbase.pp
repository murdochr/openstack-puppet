class aptrepos::aptbase (
    $server = $aptrepos::params::server_default,
    $platformversion = $aptrepos::params::platformversion_default
) inherits aptrepos::params {
    require aptrepos

    apt::source { 'ubuntu_base':
        location    => "http://${server}/${platformversion}/ubuntu/",
        release     => "${lsbdistcodename}",
        repos       => 'main restricted universe multiverse',
        include_src => true,
    } ->
    Package <| |>

    apt::source { 'ubuntu_updates':
        location    => "http://${server}/${platformversion}/ubuntu/",
        release     => "${lsbdistcodename}-updates",
        repos       => 'main restricted universe multiverse',
        include_src => true,
    } ->
    Package <| |>

    apt::source { 'ubuntu_security':
        location    => "http://${server}/${platformversion}/ubuntu/",
        release     => "${lsbdistcodename}-security",
        repos       => 'main restricted universe multiverse',
        include_src => true,
    } ->
    Package <| |>

    apt::source { 'ubuntu_backports':
        location    => "http://${server}/${platformversion}/ubuntu/",
        release     => "${lsbdistcodename}-backports",
        repos       => 'main restricted universe multiverse',
        include_src => true,
    } ->
    Package <| |>
    
}
