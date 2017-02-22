package { 'memcached':
  ensure => present,
}

file { '/etc/sysconfig/memcached':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/memecached/memcached',
  require => Package['memcached'],
  notify => Service['memcached',
}

service { 'memcached':
  ensure => running,
  enable => true,
}
