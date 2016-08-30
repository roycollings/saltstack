{%- from "vars" import vars with context %}

vim:
    pkg.installed

vim-vimrc:
  file.managed:
    - name: {{ vars.homeDir }}/.vimrc
    - source: salt:///vim/vimrc
    - user: {{ vars.user }}
    - group: {{ vars.user }}
