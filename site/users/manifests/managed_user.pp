define users::managed_user (
  $username = $title,
  $group = $title,
  $homedir = "/home/${username}",
) {
  user { $username:
    ensure => present,
    home => $homedir,
    managehome => true,
 }
file { $homedir:
  ensure => directory,
  owner => $username,
  group => $group,
  }
}
