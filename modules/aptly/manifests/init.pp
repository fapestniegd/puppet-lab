class aptly(){
  package { 'aptly':
    ensure => latest,
    require => [
                 File['/etc/apt/sources.list.d/aptly.list'],
                 Exec['add_aptly_signature'],
                 Exec['aptly_apt_get_update']
               ]
  }

  exec {'add_aptly_signature':
    command => "/usr/bin/apt-key adv --keyserver keys.gnupg.net --recv-keys 9E3E53F19C7DE460"
  }

  exec {'aptly_apt_get_update':
    command => "/usr/bin/apt-get update"
  }

  file { '/etc/apt/sources.list.d/aptly.list':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/aptly/etc/apt/sources.list.d/aptly.list',
  }
}
