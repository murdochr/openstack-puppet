class aptrepos::params (
    $server = 'uskopapt01.hibu.int',
    $keyserver = 'uskopapt01.hibu.int',
    $platformversion = $::environment
) {

    $server_default          = $server
    $keyserver_default       = $keyserver
    $platformversion_default = $platformversion 

}
