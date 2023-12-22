#!/usr/bin/pup
# Install an especific version of flask 2.1.0



exec { 'apt-update':
  command => '/usr/bin/apt-get update',
  path    => ['/usr/bin'],
  require => Exec['add-apt-repository'],
}
exec { 'install_python':
  command => '/usr/bin/apt-get update && /usr/bin/apt-get install -y software-properties-common && /usr/bin/add-apt-repository ppa:deadsnakes/ppa && /usr/bin/apt-get update && /usr/bin/apt-get install -y python3.8',
  path    => ['/usr/bin'],
  user    => 'root',
  unless  => '/usr/bin/dpkg-query --show --showformat=\'${db:Status-Status}\' python3.8 | grep -q "install"',
}
package { 'python3.8':
  ensure   => '3.8.10',
  provider => 'apt-get',
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
