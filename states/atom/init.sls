atom-ppa:
    pkgrepo.managed:
        - humanname: Atom PPA
        - name: deb http://ppa.launchpad.net/webupd8team/atom/ubuntu xenial main
        - file: /etc/apt/sources.list.d/atom.list
        - keyid: EEA14886
        - keyserver: keyserver.ubuntu.com

atom:
    pkg.installed:
        - require:
            - pkgrepo: atom-ppa

atom-groovy:
    cmd.run:
        - name: apm install language-groovy
        - require:
            - pkg: atom

atom-minimap:
    cmd.run:
        - name: apm install minimap
        - require:
            - pkg: atom

atom-autoclose-html:
    cmd.run:
        - name: apm install autoclose-html
        - require:
            - pkg: atom

atom-highlight-selected:
    cmd.run:
        - name: apm install highlight-selected
        - require:
            - pkg: atom
