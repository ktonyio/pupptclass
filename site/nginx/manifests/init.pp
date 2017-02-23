class nginx (
  $root,
) {
  # common practice to keep Resource Defaults near top of puppet file
  File {
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  $docroot = pick($root, $default_docroot)
  package { 'nginx':
    ensure => present,
  }
  file { $docroot:
    ensure => directory,
  }
  file { "${docroot}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  file { '/var/www/':
    ensure => directory,
  }
  file { '/var/www/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    # notifying the service from the file, simmilar to subscribe
    notify => Service['nginx'],
  }
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
