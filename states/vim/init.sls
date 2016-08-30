{%- from "vars" import vars with context %}

vim:
    pkg.latest:
        - refresh: True

vim-vimrc:
  file.managed:
    - name: {{ vars.homeDir }}/.vimrc
    - source: salt:///vim/vimrc
    - user: {{ vars.user }}
    - group: {{ vars.user }}
