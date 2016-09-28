{%- from "vars" import vars with context %}

mousespeed:
  file.managed:
    - name: {{ vars.homeDir }}/bin/mousespeed
    - source: salt:///handy_scripts/mousespeed
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - makedirs: True

volume:
  file.managed:
    - name: {{ vars.homeDir }}/bin/volume
    - source: salt:///handy_scripts/volume
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - makedirs: True
