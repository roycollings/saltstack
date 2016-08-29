zsh:
  pkg.installed

zsh-antigen-clone:
  git.latest:
    - name: https://github.com/zsh-users/antigen.git
    - rev: master
    - target: /opt/zsh-antigen
    - depth: 1
  cmd.run:
    - name: curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh

zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt:///zsh/zshrc
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja
