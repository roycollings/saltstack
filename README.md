sudo salt-call --local --file-root=./states state.sls xfce4-terminal

or, for everything ...

sudo salt-call --local --file-root=./states state.highstate
