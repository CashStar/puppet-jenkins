class jenkins::install inherits jenkins::params {
    case $operatingsystem {
        CentOS,RedHat: { $jenkins = 'jenkins' }
        Ubuntu: { 
                $jenkins = 'jenkins'
                file { '/etc/apt/sources.list.d/jenkins.list':
                    ensure  => present,
                    content => 'deb http://pkg.jenkins-ci.org/debian binary/',
                    notify  => Exec['add-key'],
                    before  => Package["$jenkins"],
                }
                exec { 'add-key':
                    command     => '/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -',
                    refreshonly => true,
                    notify      => Exec['apt-update'],
                    before  => Package["$jenkins"],
                }
                exec { 'apt-update':
                    command     => '/usr/bin/apt-get update',
                    refreshonly => true,
                    before  => Package["$jenkins"],
                }
            }
        default: { fail("Unrecognized operating system for webserver") }
    }
    package { "$jenkins":
        ensure => present,
    }
}
