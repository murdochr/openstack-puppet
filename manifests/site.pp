#import 'oss.pp'

class first {
            notify{'first':}
            include osi::prereq
}

class second {
####### shared variables ##################


# this section is used to specify global variables that will
# be used in the deployment of multi and single node openstack
# environments

# assumes that eth0 is the public interface
    $public_interface        = 'eth0'
# assumes that eth1 is the interface that will be used for the vm network
# this configuration assumes this interface is active but does not have an
# ip address allocated to it.
    $private_interface       = 'eth1'
# credentials
    $admin_email             = 'root@localhost'
    $admin_password          = 'keystone_admin'
    $cinder_user_password    = 'cinder_pass'
    $cinder_db_password      = 'cinder_pass'
    $keystone_db_password    = 'keystone_db_pass'
    $keystone_admin_token    = 'keystone_admin_token'
    $nova_db_password        = 'nova_pass'
    $nova_user_password      = 'nova_pass'
    $glance_db_password      = 'glance_pass'
    $glance_user_password    = 'glance_pass'
    $rabbit_password         = 'openstack_rabbit_password'
    $rabbit_user             = 'openstack_rabbit_user'
    $fixed_network_range     = '10.0.0.0/24'
    $floating_network_range  = '192.168.101.64/28'
    $secret_key              = 'secret_key'
# switch this to true to have all service log at verbose
    $verbose                 = false
# by default it does not enable atomatically adding floating IPs
    $auto_assign_floating_ip = false


#### end shared variables #################

    $controller_node_address  = '172.30.0.81'

    $controller_node_public   = $controller_node_address
    $controller_node_internal = $controller_node_address

     notify{'second':}

#
#
class { 'openstack::controller':
    public_address          => $controller_node_public,
    public_interface        => $public_interface,
    private_interface       => $private_interface,
    internal_address        => $controller_node_internal,
    floating_range          => $floating_network_range,
    fixed_range             => $fixed_network_range,
    # by default it does not enable multi-host mode
    multi_host              => true,
    # by default is assumes flat dhcp networking mode
    network_manager         => 'nova.network.manager.FlatDHCPManager',
    verbose                 => $verbose,
    auto_assign_floating_ip => $auto_assign_floating_ip,
    mysql_root_password     => $mysql_root_password,
    admin_email             => $admin_email,
    admin_password          => $admin_password,
    keystone_db_password    => $keystone_db_password,
    keystone_admin_token    => $keystone_admin_token,
    cinder_db_password      => $cinder_db_password,
    cinder_user_password    => $cinder_user_password,
    glance_db_password      => $glance_db_password,
    glance_user_password    => $glance_user_password,
    neutron                 => false,
    nova_db_password        => $nova_db_password,
    nova_user_password      => $nova_user_password,
    rabbit_password         => $rabbit_password,
    rabbit_user             => $rabbit_user,
    secret_key              => $secret_key,
  }
          
}

Class['first'] -> Class['second'] -> Class['openstack::controller']



node ub-comp-01 {
        include first
        include second
}



    #class { 'osi::oss':
    #    require =>  Class['osi::prereq']
    #}
    #class { 'osi::repo':
    #   before =>  Class['osi::prereq']
    #}




#node default {
#    notify{'hello':}
#    #include prereq 
#    #include osi
#}
