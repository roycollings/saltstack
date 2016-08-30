{%- from "vars" import vars with context %}

i3-ppa:
    pkgrepo.managed:
        - humanname: Atom PPA
        - name: deb http://ppa.launchpad.net/lvillani/i3/ubuntu xenial main
        - file: /etc/apt/sources.list.d/i3.list
        - keyid: DBF58256
        - keyserver: keyserver.ubuntu.com

i3:
    pkg.latest:
        - refresh: True
        - skip_verify: True

i3-configuration:
    file.managed:
        - name: {{ vars.homeDir }}/.config/i3/config
        - source: salt://i3/config
        - user: {{ vars.user }}
        - group: {{ vars.user }}
