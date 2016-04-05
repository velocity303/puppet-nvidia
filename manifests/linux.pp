#
class nvidia::linux (
  Integer[1] $driver_version,
) {

  case $::operatingsystem {
    'Ubuntu': {
      class { "${title}::ubuntu":
        driver_version => $driver_version
      }
    }
    default: {
      fail("${title}: Distribution '${::operatingsystem}' is not currently supported")
    }
  }
}
