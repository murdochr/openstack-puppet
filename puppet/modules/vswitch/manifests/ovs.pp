class vswitch::ovs(
  $package_ensure = 'present'
) {

  include 'vswitch::params'

  case $::osfamily {
    'Debian': {
      # OVS doesn't build unless the kernel headers are present.
      $kernelheaders_pkg = "linux-headers-$::kernelrelease"
      if ! defined(Package[$kernelheaders_pkg]) {
        package { $kernelheaders_pkg: ensure => $package_ensure }
      }
      service {'openvswitch':
        ensure      => true,
        enable      => true,
        name        => $::vswitch::params::ovs_service_name,
        hasstatus   => false, # the supplied command returns true even if it's not running
        # Not perfect - should spot if either service is not running - but it'll do
        status      => "/etc/init.d/openvswitch-switch status | fgrep 'is running'",
      }
      exec { 'rebuild-ovsmod':
        command     => "/usr/sbin/dpkg-reconfigure openvswitch-datapath-dkms > /tmp/reconf-log",
	      creates     => "/lib/modules/$::kernelrelease/updates/dkms/openvswitch_mod.ko",
	      require     => [Package['openvswitch-datapath-dkms', $kernelheaders_pkg]],
        before      => Package['openvswitch-switch'],
        refreshonly => true
      }
    }
    'Redhat': {
      service {'openvswitch':
        ensure      => true,
        enable      => true,
        name        => $::vswitch::params::ovs_service_name,
      }
    }
  }

  package { $::vswitch::params::ovs_package_name:
    ensure  => $package_ensure,
    before  => Service['openvswitch'],
  }

  Service['openvswitch'] -> Vs_port<||>
  Service['openvswitch'] -> Vs_bridge<||>
}
