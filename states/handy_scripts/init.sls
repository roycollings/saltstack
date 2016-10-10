{%- from "vars" import vars with context %}

mousespeed:
  file.managed:
    - name: {{ vars.homeDir }}/bin/mousespeed
    - source: salt:///handy_scripts/mousespeed
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - makedirs: True
    - mode: 744

volume:
  file.managed:
    - name: {{ vars.homeDir }}/bin/volume
    - source: salt:///handy_scripts/volume
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - makedirs: True
    - mode: 744

wifi_restart:
  file.managed:
    - name: {{ vars.homeDir }}/bin/wifi_restart
    - source: salt:///handy_scripts/wifi_restart
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - makedirs: True
    - mode: 744

intellij-dockerised:
  file.managed:
    - name: {{ vars.homeDir }}/bin/intellij
    - source: salt:///handy_scripts/intellij
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - makedirs: True
    - mode: 744
