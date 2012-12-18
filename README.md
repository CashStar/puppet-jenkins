puppet-jenkins
==============

Puppet module to install and configure Jenkins.

Requirements
------------

### Puppet Modules

* [nginx](https://github.com/BenoitCattie/puppet-nginx)
* [apt](https://github.com/evolvingweb/puppet-apt.git)

### SSL Cert

For SSL through nginx to work you need to have an ssl cert. You can manually put this in the directory or add it to this module if you would like.

Params
-----
Parameters can be passed in as normal or pulled in through hiera (preferred).

### Hiera
You will need a /etc/puppet/heira.yaml

    :hierarchy:
        - common
    :backends:
        - yaml
    :yaml:
        :datadir: '/etc/puppet/hieradata'

Then create a file at /etc/puppet/hieradata/common.yaml with the values needed (these are only some of the possible)

    jenkins_domain : 'jenkins.mydomain.com'
    jenkins_webroot : '/testing'

Use [this](http://www.htaccesstools.com/htpasswd-generator/) web tool to generate a $web_password

TODO
----

Integrate nginx config with nginx puppet module
