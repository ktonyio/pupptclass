class wrappers::wordpress {
  class { 'wordpress':
    #manage_repo => true,
  }
}
