Employ Puppet for the automation of generating a customized HTTP header response:
# Ensure that the Nginx package is installed
package { 'nginx':
  ensure => 'installed',
}

# This assumes that hostname fact not already defined
# If it's defined, you can remove custom fact declaration
facter::add('hostname_fact') {
  setcode => 'hostname',
}

# Configure Nginx with the custom HTTP header
file_line { 'customize_http_header':
  path  => '/etc/nginx/nginx.conf',
  match => 'http {',
  line  => "    add_header X-Served-By $::hostname_fact;",
  notify => Exec['restart_nginx'],
}

# Ensure that the Nginx service is running and enabled
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  subscribe => File_line['customize_http_header'],
}
