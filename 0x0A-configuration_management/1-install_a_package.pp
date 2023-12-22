#!/usr/bin/pup
# Install an especific version of flask 2.1.0



exec { 'apt-update':
  command => '/usr/bin/apt-get update',
  path    => ['/usr/bin'],
  require => Exec['add-apt-repository'],
}

package { 'python3.8':
  ensure   => '3.8.10',
  provider => 'apt',
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
