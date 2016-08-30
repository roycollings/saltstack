
docker-install:
  cmd.run:
    - name: wget -qO- https://get.docker.com | sh 

docker-add-to-group:
  cmd.run:
    - name: sudo usermod -aG docker $USER

docker-update-current-group:
  cmd.run:
    - name: newgrp docker
