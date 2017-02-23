class profile::base {
#  notify { "Hello, my name is ${::hostname}": }
  $hostname = hiera('hostname', 'not working')
  notify { "Hello, my name is ${hostname}": }
}
