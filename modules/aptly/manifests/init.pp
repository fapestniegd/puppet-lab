class aptly(){
#  package { 'aptly':
#    ensure => latest
#    
#  }

  file { '/etc/apt/source.list.d/aptly.list':
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/aptly/etc/apt/source.list.d/aptly.list',
  }
}
