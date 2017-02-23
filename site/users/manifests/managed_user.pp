define users::managed_user (
  $username = $title,
  $homedir => "/home/${username}",
  $group => 'users',
  $sshdir => "/home/${user}/.ssh",
) {
  user { $username:
    ensure => present,
    home => $homedir
    managehome => true,
  }
  
}
