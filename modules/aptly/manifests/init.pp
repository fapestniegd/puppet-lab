class aptly(){
  package { 'aptly':
    ensure => latest,
    require => File['/etc/apt/sources.list.d/aptly.list'] 
  }

  file { '/etc/apt/sources.list.d/aptly.list':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/aptly/etc/apt/sources.list.d/aptly.list',
  }
}
