arandr-ppa:
    pkgrepo.managed:
        - humanname: ARandR PPA
        - name: deb http://ppa.launchpad.net/chrysn/arandr/ubuntu raring main
        - file: /etc/apt/sources.list.d/arandr.list
        - keyid: FBAE0E59
        - keyserver: keyserver.ubuntu.com

arandr:
    pkg.latest:
        - refresh: True

