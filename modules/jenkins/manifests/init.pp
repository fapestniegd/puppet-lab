#init.pp for adding jenkins with latest version 

#Class that rolls it all together
class jenkins {
  package { 'jenkins':
    ensure => latest, 
    require => [ 
                 File['/etc/apt/source.list.d/jenkins.list'],
                 Exec['add_jenkins_signature'],
                 Exec['jenkins_apt_get_update']
               ]
        
  }
 
  #create apt source list file for jenkins 
  file { '/etc/apt/source.list.d/jenkins.list':
       ensure => file, 
       mode   => '0644',
       owner  => 'root',
       group  => 'root',
       source => 'puppet:///modules/jenkins/etc/apt/sources.list.d/jenkins.list', 
   }


  # Execute line for Adding Jenkins gpg signature to host
  exec {'add_jenkins_signature':
           command => "wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -"
   }
  
  # Execute line for updating apt sources list after adding jenkins gpg key 
  exec {'jenkins_apt_get_update':
           command => "/usr/bin/apt-get update"
  }
   
 
}
