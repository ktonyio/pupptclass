class skeleton {
  file { '/etc/skell':
    ensure => directory,
  }
  file { '/etc/skel/.bashrc':
    ensure => file,
    source => 'puett://modules/skeleton/bashrc',
  }
}
