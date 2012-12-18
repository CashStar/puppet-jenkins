class jenkins::config inherits jenkins::params {
    include jenkins::proxy
    file {
       "$home_dir":
            ensure => directory,
            owner   =>  'jenkins';
       "$home_dir/.pip/":
            ensure => directory,
            owner   =>  'jenkins';
        'pip.conf':
            ensure => present,
            source => 'puppet:///modules/jenkins/pip.conf',
            path   => "$home_dir/.pip/pip.conf",
            owner   =>  'jenkins';
    }
    file { '/etc/default/jenkins':
        ensure  => present,
        content => template('jenkins/defaults.erb'),
        notify  =>  Service['jenkins'];
    }
    file { 'hgrc_jenkins':
        ensure  => present,
        content => template('jenkins/hgrc.erb'),
        path    => "$home_dir/.hgrc",
        owner   =>  'jenkins',
    }
}
