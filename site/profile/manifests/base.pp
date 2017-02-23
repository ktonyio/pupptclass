class profile::base {
#  notify { "Hello, my name is ${::hostname}": }
  notify { "Hello, my name is hiera('hostname', 'not working')": }
}
