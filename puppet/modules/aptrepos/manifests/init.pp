class aptrepos (
    $server = 'uskopapt01.hibu.int',
    $keyserver = 'uskopapt01.hibu.int',
    $platformversion = $::environment
) {
    class { 'apt':
        disable_keys         => false,
        purge_sources_list   => true,
        purge_sources_list_d => true,
        purge_preferences_d  => true,
    }

    class { 'aptrepos::params':
        server          => $aptrepos::server,
        keyserver       => $aptrepos::keyserver,
        platformversion => $aptrepos::platformversion,
    }
    
}
