class users::admins {
  users::managed_user { 'joe': }
  users::managed_user { ['aaron', 'alice']:
    group => 'staff',
  }
  group { 'staff':
    ensure => present,
  }
}
