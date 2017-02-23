class profile::wordpress {
  class {'mysql::server':
    root_password => 'password',
  }
  class { 'mysql::bindings':
    php_enable => true
  }
  
  include apache
  include apache::mod::php
  apache::vhost { $::fqdn:
    port => '8080',
    priority => '00',
    docroot => '/opt/wordpress'
  }
  
  include ::wordpress
}
