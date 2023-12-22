#!/usr/bin/pup
# install_packages.pp

# Install Python 3.8.10
class { 'python':
  version => '3.8.10',
}

# Install Flask version 2.1.0 using pip3
package { 'Flask':
  ensure          => '2.1.0',
  provider        => 'pip3',
}

# Install Werkzeug version 2.1.1 using pip3
package { 'Werkzeug':
  ensure          => '2.1.1',
  provider        => 'pip3',
}

# Notify the user about the installation
notify { 'Packages installed':
  message => 'Python 3.8.10, Flask 2.1.0, and Werkzeug 2.1.1 have been installed.',
}
