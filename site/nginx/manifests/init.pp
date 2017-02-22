class nginx {
case $::osfamily {
'redhat','debian':{
      $package='nginx'
      $owner='root'
      $group='root'
      $docroot = '/var/www'
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
    }
    'windows': {
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group = 'Administrators'
      $docroot = 'C:/ProgramData/nginx/html'
      $confdir = 'C:/ProgramData/nginx'
      $logdir = 'C:/ProgramData/nginx/logs' 
    }
    default : {
      fail("Unsupported OS! (${::osfamily})")
}
    }
    $user = $::osfamily ? {
    'redhat'  => 'nginx',
    'debian'  => 'www-data',
    'windows' => 'nobody',
  }

    
File {
owner => 'root',
group => 'root',
mode => '0664',
}
package { 'nginx':
ensure => present,
}
file { [ '$docroot', "${confdir}/conf.d" ]:
ensure => directory,
}
file { '$docroot/index.html':
ensure => file,
source => 'puppet:///modules/nginx/index.html',
}
file { "${configdir}/nginx.conf":
ensure => file,
content      => epp('nginx/nginx.conf.epp', {
        user     => $user,
        logdir   => $logdir,
        confdir => $confdir,
})
require => Package['nginx'],

}
file {"${confdir}/default.conf":
ensure => file,
content     => epp('nginx/default.conf.epp', {docroot => $docroot}),
notify => Service['nginx'],
require => Package['nginx'],
}
service { 'nginx':
ensure => running,
enable => true,
}
}
