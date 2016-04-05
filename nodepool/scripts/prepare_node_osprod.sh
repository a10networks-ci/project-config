#!/bin/sh

echo "127.0.1.1 `hostname` `hostname -s`" | sudo tee -a /etc/hosts
sudo useradd jenkins
sudo mkdir -p /home/jenkins/.ssh
printf "ssh_rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeSH0sAGc/5wqGafONTpioZUhOCRQYRv43X3qp4zHsL7i/L+t84pjt0MPWe9WyzZdF8BopIYx2tLSIq7T0ZYtCSujo12SzhldMe5NVORX6W7QzDOEI1w3DgoeKxqCU491pA0nNahiYwBzwF+YqzljAWu+zA/Q0E3QWuqfSuVGF6fpt7pMHon5Z0tEyKjh/PwVBjb0U6TF4QqOY1yoVXnRGtOylV1cpAY8CVAoo7DvlZiVwPsSY/d4oK4mffoPJ/IdYwmki53C3D58XosptXhbB/ZDf3RKfVBkKrJS50uVuinCVvL8TGZcX2E0LJkWQj2+i4Qsd+YzUcz5CofFr7gMd jenkins@area51.boi.a10networks.com\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeSH0sAGc/5wqGafONTpioZUhOCRQYRv43X3qp4zHsL7i/L+t84pjt0MPWe9WyzZdF8BopIYx2tLSIq7T0ZYtCSujo12SzhldMe5NVORX6W7QzDOEI1w3DgoeKxqCU491pA0nNahiYwBzwF+YqzljAWu+zA/Q0E3QWuqfSuVGF6fpt7pMHon5Z0tEyKjh/PwVBjb0U6TF4QqOY1yoVXnRGtOylV1cpAY8CVAoo7DvlZiVwPsSY/d4oK4mffoPJ/IdYwmki53C3D58XosptXhbB/ZDf3RKfVBkKrJS50uVuinCVvL8TGZcX2E0LJkWQj2+i4Qsd+YzUcz5CofFr7gMd\n" | sudo tee -a /home/jenkins/.ssh/authorized_keys
sudo chown -R jenkins /home/jenkins
echo "jenkins ALL=NOPASSWD: ALL" | sudo tee -a /etc/sudoers

whoami
ls -la /home/jenkins

sudo apt-get -y update
sudo apt-get -y install git


