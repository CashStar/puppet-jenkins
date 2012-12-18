class jenkins::proxy inherits jenkins::params {
    if $proxy_nginx {
        apt::ppa { 'ppa:nginx/stable':
            before => Class['nginx'],
        }
        include nginx
        nginx::site { 'default':
            ensure => absent,
        }
        nginx::config { 'jenkins':
            ensure  => present,
            content => template('jenkins/jenkins.conf.erb'),
            order   => '001',
        }
        if $web_username {
            file { '/etc/nginx/passwd':
                ensure => present,
                content => "$web_username:$web_password",
                owner   =>  'nginx',
                group   =>  'nginx',
                before  =>  nginx::config['jenkins'];
            }
        }
    }
}
