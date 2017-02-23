class profile::wordpress (
  # this file is wrapping all of our site-specific configuration into a profile
  # class declaration is like including the class. it allows us to override some config here
  class { 'mysql::server':
    root_password => 'root'
  }
  class { 'mysql::bindings':
    php_enable => true,
  }
  
  include apache
  include apache::mod::php
  apache::vhost { $::fqdn:
    port => '8080',
    priority => '00',
    docroot => '/opt/wordpress',
  }

  include ::wordpress
}
