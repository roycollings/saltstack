Install saltstack:

curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh

edit /etc/sal/minion -> set "file_client: local"

Run saltstack:

sudo salt-call --local --file-root=./states state.sls xfce4-terminal

or, for everything ...

sudo salt-call --local --file-root=./states state.highstate
