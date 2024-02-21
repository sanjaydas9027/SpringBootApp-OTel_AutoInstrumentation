## Install Docker

```bash
sudo apt update
sudo apt install docker.io

# Grant Jenkins user and Ubuntu user permission to docker daemon
sudo su -
usermod -aG docker jenkins
usermod -aG docker ubuntu
systemctl restart docker

```


