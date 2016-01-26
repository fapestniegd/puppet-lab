node /puppet-lab.githubapp.com/ {
include puppet::local
include aptly
include jenkins

  file { '/root/bin':
    ensure => 'directory',
    path => '/root/bin',
    owner => 'root',
    mode => '700',
  }

}
