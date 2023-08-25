# This manifest creates a file at /tmp
file { '/tmp/school':
    ensure  => 'file',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0726',
    content => 'I love Puppet',
}
