node /puppet-lab.githubapp.com/ {
include puppet::local

  file { '/root/bin':
    ensure => 'directory',
    path => '/root/bin',
    owner => 'root',
    mode => '700',
  }

}
