{%- from "vars" import vars with context %}

git:
    pkg.installed

gitconfig:
  file.managed:
    - name: {{ vars.homeDir }}/.gitconfig
    - source: salt:///git/gitconfig
    - user: {{ vars.user }}
    - group: {{ vars.user }}

