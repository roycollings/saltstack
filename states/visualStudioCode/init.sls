install Visual Studio Code:
  cmd.run:
    - name: dpkg -i /tmp/code.deb
    - unless: dpkg -s code
    - require:
      - file: /tmp/code.deb

#curl -I https://go.microsoft.com/fwlink/?LinkID=760868
#Location: https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable
/tmp/code.deb:
  file.managed:
    - skip_verify: true
    - source: https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable
