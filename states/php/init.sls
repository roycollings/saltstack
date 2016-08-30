php-ppa:
    pkgrepo.managed:
        - humanname: PHP PPA
        - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
        - file: /etc/apt/sources.list.d/php.list
        - keyid: E5267A6C
        - keyserver: keyserver.ubuntu.com

php:
    pkg.latest:
        - refresh: True

