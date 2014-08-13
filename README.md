docker-remote-syslog
====================

Dockerfile to watch and transmit logs on the host or other containers via remote_syslog2.

Based on [remote_syslog2](https://github.com/papertrail/remote_syslog2) written by [Papertrail](https://papertrailapp.com).

### Usage
#### Simply watch /var/log/foo
    docker run -d -v /foo/foo.log:/foo.log shopigniter/remote_syslog \
        -d {{destination_hostname}} -p {{destination_port}} /foo.log
#### Watching multiple files
    docker run -d -v /var/log:/var/log -v /app/err.log:/app_err.log shopigniter/remote_syslog \
        -d {{destination_hostname}} -p {{destination_port}} \
        /var/log/php_errors.log /var/log/apache2/access.log /app_err.log
#### Custom Hostname
    docker run -d -v /foo/foo.log:/foo.log shopigniter/remote_syslog \
        -d {{destination_hostname}} -p {{destination_port}} --hostname=foo /foo.log
#### With TLS
    docker run -d -v /foo/foo.log:/foo.log shopigniter/remote_syslog \
        -d {{destination_hostname}} -p {{destination_port}} --tls=true /foo.log
#### Linking containers
    docker run -d --name="myapp" -v /var/log -p 80:80 jaredm4/apache-php55
    docker run -d --volumes-from="myapp" shopigniter/remote_syslog \
        -d {{destination_hostname}} -p {{destination_port}} /var/log/php_errors.log
#### Further command options and help
    docker run shopigniter/remote_syslog --help
