class wrappers::apache {
  class { 'apache':
    #manage_repo => true,
  }
}
