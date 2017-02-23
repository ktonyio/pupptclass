class wrappers::redis {
  class { 'redis':
    manage_repo => true,
  }
}
