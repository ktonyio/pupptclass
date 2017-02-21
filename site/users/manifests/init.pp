class users { 
user { 'fundamentals':
ensure => present,
gid = > 'wheel',
}
}
