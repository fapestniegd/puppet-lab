class puppet::local(){
  package { 'puppet':
    ensure => latest
  }

  file { '/root/bin/pupprun':
    ensure => file,
    mode   => '0700',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/puppet/root/pupprun',
  }
}
