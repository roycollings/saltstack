{%- from "vars" import vars with context %}

zsh:
  pkg.installed

zsh-antigen-clone:
  git.latest:
    - name: https://github.com/zsh-users/antigen.git
    - rev: master
    - target: /opt/zsh-antigen
    - depth: 1
    - force_reset: True
  cmd.run:
    - name: curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh

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
