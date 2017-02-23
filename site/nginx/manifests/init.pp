class nginx (
  $docroot = $nginx::params::docroot,
) inherits nginx:params {
  package { 'nginx':
    ensure => latest,
  }
  File {
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  file { "$docroot":
    ensure => directory,
    mode => '0755',
  }
  file { '/var/www/index.html':
    source => 'puppet:///modules/nginx/index.html',
  }
  file { '/etc/nginx/nginx.conf':
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }
  file { '/etc/nginx/conf.d/default.conf':
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File['/etc/nginx/nginx.conf', '/etc/nginx/conf.d/default.conf'],
  }
}
