class nginx::params {
  case $facts['os']['family'] {
    'RedHat': {
      $docroot = '/var/nginx'
    }
    'Debian': {
      $docroot = '/var/www'
    }
  }
}
