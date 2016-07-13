#
class nvidia::linux::ubuntu (
  Integer[1] $driver_version,
  ) {
  $package_name = "nvidia-${driver_version}"

  # Ensure that our custom fact can run
  ensure_resource('package', 'pciutils', {'ensure' => 'present' })

  if $::nvidiagfx {
    apt::key { 'graphics-drivers':
      id     => '2388FF3BE10A76F638F80723FCAE110B1118213C',
      source => 'keyserver.ubuntu.com',
    }
    apt::source { 'graphics-drivers':
      location => 'http://ppa.launchpad.net/graphics-drivers/ppa/ubuntu',
      release  => $::lsbdistcodename,
      repos    => 'main',
    }
    apt::pin { 'main':
      packages => 'nvidia-*',
      priority => 501,
      origin   => 'ppa.launchpad.net'
    }
    ensure_resource( 'package', $package_name, {
      'ensure' => 'present',
      require => Class['apt::update']
    })
  }
}
