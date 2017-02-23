class wrappers::mysql {
  mysql::fragment { "*/soft/nofile":
    value => "1024",
  }
}
