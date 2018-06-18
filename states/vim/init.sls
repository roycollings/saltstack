{%- from "vars" import vars with context %}

vim:
    pkg.installed

cmake:
    pkg.installed

mono-xbuild:
    pkg.installed

nodejs:
    pkg.installed

npm:
    pkg.installed

vim-vimrc:
  file.managed:
    - name: {{ vars.homeDir }}/.vimrc
    - source: salt:///vim/vimrc
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-install-dependencies:
  cmd.script:
    - require:
      - vim-vimrc
    - source: salt:///vim/install_deps
    - user: {{ vars.user }}
    - group: {{ vars.user }}
    - shell: /bin/zsh

vim-dbext-config
  file.managed:
    - name: {{ vars.homeDir }}/.vim/dbext-config
    - source: salt:///vim/dbext-config
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-bundle-configs:
  file.managed:
    - name: /tmp/bundle-configs
    - source: salt:///vim/bundle-configs
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-tern-project:
  file.managed:
    - require:
      - vim-vimrc
    - name: {{ vars.homeDir }}/.tern-project
    - source: salt:///vim/tern-project
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-youcompleteme-remove:
  cmd.run:
    - name: rm -rf {{ vars.homeDir }}/.vim/bundle/YouCompleteMe
    - cwd: {{ vars.homeDir }}/.vim/bundle
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-youcompleteme-clone:
  cmd.run:
    - name: git clone https://github.com/Valloric/YouCompleteMe.git
    - cwd: {{ vars.homeDir }}/.vim/bundle
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-youcompleteme-submodule:
  cmd.run:
    - name: git submodule update --init --recursive
    - cwd: {{ vars.homeDir }}/.vim/bundle/YouCompleteMe
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-youcompleteme-tern:
  cmd.run:
    - name: {{ vars.homeDir }}/.vim/bundle/YouCompleteMe/install.py --tern-completer
    - cwd: {{ vars.homeDir }}/.vim/bundle/YouCompleteMe
    - user: {{ vars.user }}
    - group: {{ vars.user }}

vim-youcompleteme-all:
  cmd.run:
    - name: npm install -g typescript
    - cwd: {{ vars.homeDir }}/.vim/bundle/YouCompleteMe
    - user: {{ vars.user }}
    - group: {{ vars.user }}
