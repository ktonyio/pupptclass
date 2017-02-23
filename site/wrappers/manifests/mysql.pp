class wrappers::mysql {
  class { 'mysql':
    #manage_repo => true,
  }
}
