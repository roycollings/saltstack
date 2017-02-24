{%- from "vars" import vars with context %}

vim:
    pkg.installed

vim-vimrc:
  file.managed:
    - name: {{ vars.homeDir }}/.vimrc
    - source: salt:///vim/vimrc
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-tern-project:
  file.managed:
    - name: {{ vars.homeDir }}/.tern-project
    - source: salt:///vim/tern-project
    - user: {{ vars.user }}
    - group: {{ vars.user }}
