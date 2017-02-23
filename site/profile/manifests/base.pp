class profile::base {
  notify { "Hello, my name is ${::hostname}": }
  
  notify { heira('message'): }
}
