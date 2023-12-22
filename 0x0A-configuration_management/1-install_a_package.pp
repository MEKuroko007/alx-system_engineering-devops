#!/usr/bin/pup
# install_packages.pp


exec { 'install_python':
  command => '/usr/bin/apt-get update && /usr/bin/apt-get install -y software-properties-common && /usr/bin/add-apt-repository ppa:deadsnakes/ppa && /usr/bin/apt-get update && /usr/bin/apt-get install -y python3.8',
  path    => ['/usr/bin'],
  user    => 'root',
}

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}


