# == Class: motd
#
# Module to manage motd
#
class motd (

) {

  case $::role {
    'puppetmaster': {
      $banner = "\nWelcome to the Puppet Master\n"
    }
    'webserver': {
      $banner = "\nBanner 2 Banner on the Webserver\n"
    }
    default: {
      fail("Role is <${::role}>. I am only meant to work on puppetmasters and webservers.")
    }
  }

  #$notes = $::role ? {
  #'puppetmaster' => "Welcome to the Puppet Master\n",
  #'webserver'  => "Banner 2 Banner on the Webserver\n",
  #default      => "Yoooo Hooooo you are default\n",
  #}


  file { '/etc/motd':
    ensure  => file,
    #source => 'puppet:///modules/motd/motd',
    content => "${notes}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # potentially include/require other modules

  # validate all params

}
