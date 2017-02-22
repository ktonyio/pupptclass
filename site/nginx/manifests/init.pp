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
    ensure => file
    source => 'puppet:///modules/nginx/index.html'
  }
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/nginx.conf'
  }
  file { '/etc/nginx/default.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/default.conf'
  }
}
