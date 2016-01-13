class nvidia::linux::ubuntu (
	Integer[1] $driver_version,
) {
	$package_name = "nvidia-${driver_version}"

	# Ensure that our custom fact can run
	ensure_resource('package', 'pciutils', {'ensure' => 'present' })

	if $nvidiagfx {
		include apt

		apt::ppa { 'ppa:graphics-drivers/ppa':
			package_manage => true
		}
	
		ensure_resource( 'package', 'pciutils', {
			'ensure' => 'present',
			require => Class['apt::update']
		})
	}
}
