#!/usr/bin/pup

# Install a specific version of Python 3.8
package { 'python3.8':
  ensure   => '3.8.18-1+jammy1',
  provider => 'apt',
  install_options => ['--allow-downgrades'],
}


# Install pip for Python 3
package { 'python3-pip':
  ensure   => 'installed',
  provider => 'apt',
  require  => Package['python3.8'],
}

# Install Flask and Werkzeug using pip3
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
