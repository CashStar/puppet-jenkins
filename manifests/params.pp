#Use this to generate web password: http://www.htaccesstools.com/htpasswd-generator/
class jenkins::params (
    $jenkins_domain = hiera("jenkins_domain", "mydomain.com"),
    $log_dir = hiera("log_dir", "/var/log/"),
    $home_dir = hiera("jenkins_dir", "/var/lib/jenkins"),
    $port = hiera("jenkins_port", "8080"),
    $web_username = hiera("jenkins_web_username", undef),
    $web_password = hiera("jenkins_web_password", undef),
    $timezone = hiera("timezone", "America/New_York"),
    $webroot = hiera("jenkins_webroot", "/jenkins"),
    $kiln_prefix = hiera("kiln_prefix", undef),
    $kiln_username = hiera("kiln_username", undef),
    $kiln_password = hiera("kiln_password", undef),
    $kiln_fingerprint = hiera("kiln_fingerprint", undef),
    $proxy_nginx = hiera("proxy_nginx", "true"),
) 
{
}
