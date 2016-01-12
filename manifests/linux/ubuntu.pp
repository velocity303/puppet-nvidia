class nvidia::linux::ubuntu (
	Integer[1] $driver_version,
) {
	include apt

	$package_name = "nvidia-${driver_version}"

	apt::ppa { 'ppa:graphics-drivers/ppa':
		package_manage => true
	}

	package { $package_name:
		ensure => present,
		require => Class['apt::update']
	}
}
