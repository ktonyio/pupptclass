class profile::base {
#  notify { "Hello, my name is ${::hostname}": }
  $message = hiera('message', 'This is not from Hiera')
  notify { $message: }
}
