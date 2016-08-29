Install saltstack:

get -qO- https://bootstrap.saltstack.com | sudo sh -s -- -P -d git develop

Run saltstack:

sudo salt-call --local --file-root=./states state.sls xfce4-terminal

or, for everything ...

sudo salt-call --local --file-root=./states state.highstate
