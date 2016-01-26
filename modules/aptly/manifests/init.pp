class aptly(){
  package { 'aptly':
    ensure => latest,
    require => [
                 File['/etc/apt/sources.list.d/aptly.list'],
                 Exec['add_aptly_signature']
               ]
  }

  exec {'add_aptly_signature':
    command => "/usr/bin/apt-key adv --keyserver keys.gnupg.net --recv-keys E083A3782A194991"
  }

  file { '/etc/apt/sources.list.d/aptly.list':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/aptly/etc/apt/sources.list.d/aptly.list',
  }
}
