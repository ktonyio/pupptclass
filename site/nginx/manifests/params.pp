class nginx::params {
  case $facts['os']['family'] {
    'RedHat': {
      $docroot = '/var/www'
    }
    'Debian': {
      $docroot = '/var/www'
    }
  }
}
