docker-compose-install:
  cmd.run:
    - name: curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

docker-compose-set-permissions:
  cmd.run:
    - name: chmod a+x /usr/local/bin/docker-compose
