{%- from "vars" import vars with context %}

zsh:
    pkg.installed

zsh-antigen-clone:
    git.latest:
        - name: https://github.com/zsh-users/antigen.git
        - rev: master
        - target: /opt/zsh-antigen
        - depth: 1
    cmd.run:
        - name: ln -s /opt/zsh-antigen/antigen.zsh ~/.antigen.zsh

zsh-zshrc:
    file.managed:
        - name: {{ vars.homeDir }}/.zshrc
        - source: salt:///zsh/zshrc
        - user: {{ vars.user }}
        - group: {{ vars.user }}

zsh-zshrc.user:
    file.managed:
        - name: {{ vars.homeDir }}/.zshrc.user
        - source: salt:///zsh/zshrc.user
        - user: {{ vars.user }}
        - group: {{ vars.user }}

zsh-set-default-shell:
        cmd.run:
            - name: chsh -s /bin/zsh
