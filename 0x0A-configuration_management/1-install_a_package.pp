#!/usr/bin/pup
# Install an especific version of flask (2.1.0)
# 1-install_a_package.pp

package { 'python3':
  ensure => installed,
}

package { 'python3-pip':
  ensure => installed,
  require => Package['python3'],
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
  require  => Package['python3-pip'],
}

exec { 'install_werkzeug':
  command => 'pip3 install Werkzeug==2.1.1',
  unless  => 'pip3 show Werkzeug | grep Version | grep -q 2.1.1',
  require => Package['python3-pip'],
}

