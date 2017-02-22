class nginx {
  package { 'nginx':
    ensure => latest
  }
 file { '/var/www':
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode => '0755'
  }
  file { '/var/www/index.html':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755'
    source => 'puppet:///modules/nginx/index.html'
  }
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx']
  }
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/default.conf'
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File['/etc/nginx/nginx.conf', '/etc/nginx/conf.d/default.conf']
  }
}
