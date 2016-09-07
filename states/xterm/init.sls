{%- from "vars" import vars with context %}

xterm-xdefaults:
  file.managed:
    - name: {{ vars.homeDir }}/.Xdefaults
    - source: salt:///xterm/Xdefaults
    - user: {{ vars.user }}
    - group: {{ vars.user }}

  cmd.run:
    - name: xrdb ~/.Xdefaults
