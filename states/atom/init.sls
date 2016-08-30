atom-ppa:
    pkgrepo.managed:
        - humanname: Atom PPA
        - name: deb http://ppa.launchpad.net/webupd8team/atom/ubuntu xenial main
        - file: /etc/apt/sources.list.d/atom.list
        - keyid: EEA14886
        - keyserver: keyserver.ubuntu.com

atom:
    pkg.latest:
        - refresh: True

atom-groovy:
    cmd.run:
        - name: apm install language-groovy

atom-minimap:
    cmd.run:
        - name: apm install minimap

atom-autoclose-html:
    cmd.run:
        - name: apm install autoclose-html

atom-highlight-selected:
    cmd.run:
        - name: apm install highlight-selected
