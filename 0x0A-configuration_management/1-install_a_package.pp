#!/usr/bin/pup
# Using Puppet, install flask V2.1.0
exec { 'install_flask':
  command => 'sudo /usr/bin/python3 -m pip install flask==2.1.0',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/python3 -m pip show flask | grep Version | grep -q 2.1.0',
}
