class skeleton {
  file { '/etc/skell':
    ensure => directory,
  }
  file { '/etc/skel/.bashrc':
    ensure => file,
    source => 'puppett://modules/skeleton/bashrc',
  }
}
