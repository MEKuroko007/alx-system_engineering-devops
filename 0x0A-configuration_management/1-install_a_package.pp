#!/usr/bin/pup
# Install an especific version of flask 2.1.0

package { 'python3.8':
  ensure   => '3.8.10',
  provider => 'apt',
}

exec { 'check-pip3':
  command => '/usr/bin/which pip3',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/test -x /usr/bin/pip3',
}

package { 'python3-pip':
  ensure  => 'installed',
  provider => 'apt',
  require => Exec['check-pip3'],
}


package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
