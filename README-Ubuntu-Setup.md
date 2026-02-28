# Eric Wanchic's Online Portfolio - Ubuntu Setup

## Update OS

* Make sure your system is up-to-date and clean:

  ```bash
  apt-get update
  apt-get dist-upgrade
  apt-get autoclean
  apt-get autoremove
  ```

## System Dependencies

* Install Software Prerequisites

  ```bash
  apt-get install curl wget gnupg gpg software-properties-common \
                  ca-certificates apt-transport-https lsb-release
  ```

## Install Docker

* Remove Old Docker Versions (if any)

  ```bash
  apt-get remove docker docker-engine docker.io containerd runc
  ```

* Add Docker Official GPG Key

  ```bash
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  ```

* Add Docker Repository

  ```bash
  echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  ```

* Install Docker Engine

  ```bash
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io \
                      docker-buildx-plugin docker-compose-plugin
  ```

* Start & Enable Docker

  ```bash
  sudo systemctl enable docker
  sudo systemctl start docker
  ```

  Verify:

  ```bash
  sudo systemctl status docker
  ```

* Allow Docker Without `sudo` (Recommended)

  ```bash
  sudo usermod -aG docker $USER
  ```

  Then **log out and back in**, or run:

  ```bash
  newgrp docker
  ```

  Test:

  ```bash
  docker run hello-world
  ```

* _If you are only using Docker Images, then you can skip the rest_

* _If you are building Docker images and/or working with rails code, please continue_

## Ruby/Gemset(s) Version Manager

### RVM (Preferred)

* Install [RVM](https://rvm.io/)

* Ensure you have the right ruby version installed

  ```bash
  rvm install ruby-4.0.1
  ```

* `.ruby-version` file should auto load correct ruby version when you `cd`
  into the folder

### ASDF

* Install [ASDF](https://asdf-vm.com/)

### rbenv

* Install [rbenv](https://rbenv.org/)

## Source Code Manager (_Distributed Version Control System_)

### git

* Install [git](https://git-scm.com/)

  ```bash
  apt-get install git
  ```

## Linters

* Install linters for JSON & YAML

  ```bash
  sudo apt install jq yamllint
  ```

## Node Version Manager

### NVM (Preferred)

* Install [NVM](https://github.com/nvm-sh/nvm)

* Ensure you have the right ruby version installed

  ```bash
  nvm install 24.14.0
  ```

* `.nvmrc` file should auto load correct ruby version when you `cd`
  into the folder
