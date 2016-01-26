node /puppet-lab.githubapp.com/ {
  file { '/root/bin':
    ensure => 'directory',
    path => '/root/bin',
    owner => 'root',
    mode => '700',
  }
}
