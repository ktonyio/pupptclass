class nginx ( 
  String $package = $nginx::params::package,
  String $owner = $nginx::params::owner,
  String $group = $nginx::params::group,
  String $docroot = $nginx::params::docroot,
  String $confdir = $nginx::params::confdir,
  String $logdir = $nginx::params::logdir,
  String $port = $nginx::params::port,
) inherits nginx::params {
  File {
    owner => 'root',
    group => 'root',
    mode => '0664',
  }
  package { 'nginx':
    ensure => latest,
  }
  file { [$docroot, "${confdir}/conf.d"]:
    ensure => directory,
  }
  file { "${docroot}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  file { "${confdir}/nginx.conf":
    ensure       => file,
    content      => epp('nginx/nginx.conf.epp', {
        user     => $user,
        logdir   => $logdir,
        confdir => $confdir,
      }),
    require => Package['nginx'],
  }
  file { "${confdir}/conf.d/default.conf":
    ensure      => file,
    content     => epp('nginx/default.conf.epp', { docroot => $docroot, port => $port }),
    require => Package['nginx'],
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File["${confdir}/nginx.conf", "${confdir}/conf.d/default.conf"],
  }
}
