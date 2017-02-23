class wrappers::apache {
  apache::fragment { "*/soft/nofile":
    value => "1024",
  }
}
