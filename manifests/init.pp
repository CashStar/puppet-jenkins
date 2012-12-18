class jenkins inherits jenkins::params {
    include jenkins::install
    include jenkins::config
    include jenkins::service

    Class['jenkins::install'] -> Class['jenkins::config'] -> Class['jenkins::service']

}
