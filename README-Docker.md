# Eric Wanchic's Online Portfolio - Docker Server

<table>
<tr>
<th>📊 Project</th>
<th>✅ CI</th>
<th>🧹 Linting</th>
<th>📦 Repository</th>
<th>🚀 CD</th>
</tr>

<tr>

<td valign="top">

<img src="https://img.shields.io/badge/Ruby-4.0.1-red"><br>
<img src="https://img.shields.io/badge/Rails-8.1.2-red"><br>
<img src="https://img.shields.io/github/license/wanchic/wanchic-portfolio">

</td>

<td valign="top">

<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/ci_audit_gems.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/ci_audit_js.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/ci_audit_ruby.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/ci_code_test.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/ci_system_test.yml/badge.svg"><br>

</td>

<td valign="top">

<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_bash.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_css_sass.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_docker.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_erb.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_html.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_js.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_json.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_markdown.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_ruby.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_yaml.yml/badge.svg"><br>

</td>

<td valign="top">

<img src="https://img.shields.io/github/last-commit/wanchic/wanchic-portfolio"><br>
<img src="https://img.shields.io/github/repo-size/wanchic/wanchic-portfolio"><br>
<img src="https://img.shields.io/github/issues/wanchic/wanchic-portfolio">

</td>

<td valign="top">

<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/cd_docker_main_build.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/cd_docker_deps_build.yml/badge.svg"><br>

</td>

</tr>
</table>

## Setup & Installation

* Ubuntu

  Make sure your system is up-to-date and clean:

  ```bash
  apt-get update
  apt-get dist-upgrade
  apt-get autoclean
  apt-get autoremove
  ```

### System Dependencies

* Install Software Prerequisites

    * Ubuntu

      ```bash
      apt-get install curl wget gnupg gpg software-properties-common \
                      ca-certificates apt-transport-https lsb-release
      ```

    * git

      ```bash
      apt-get install git
      ```

* Install Docker Desktop
    * [Docker Desktop](https://docs.docker.com/compose/install/) for your OS platform

### WebApp - Download

* Setup SSH keys on Github

* Download `wanchic-portfolio`

  ```bash
  git clone git@github.com:wanchic/wanchic-portfolio.git
  ```

### Docker WebApp - Running All Services

#### Setup

* Initial Setup
    * First, you will need to fulfill all dependencies above.
      This includes the pipeline repository's ingestion.

* Set the Environment Variables
    * Clone the `.env-template` file as an `.env` file.
      Fill out the `.env` environment variables inside the `Docker Server` section.

* Access Rails Credentials
    * It is best to setup the `secret_base_key` for production.
      This will be done automatically by executing the line below,
      and saving the file.

      ```bash
      EDITOR="vim" bin/rails credentials:edit --environment production
      ```

#### Running Docker Compose (from build)

* Start the application:

  ```bash
  docker compose up --build --force-recreate
  ```

* All necessary images will download if not downloaded previously
* Wanchic's Portfolio App will build based on the local repo.

#### Confirming Running Images

* Execute to display Running Images

  ```bash
  docker ps
  ```

* Display List of Running Images.
  _Note: Image NAMES will be important for the next step_

  ```bash
  CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS         PORTS                    NAMES
  413912da0a45   wanchic-portfolio-web_build   "/rails/bin/docker-e…"   9 seconds ago   Up 9 seconds   0.0.0.0:3034->3000/tcp   wanchic-portfolio-web_build-1
  ```

#### Running Docker Compose (from an Image)

* `DOCKER_IMAGE` & `DOCKER_IMAGE_VERSION` should be specified in your `.env` file.
  However, they can be overrode on commandline.

* `DOCKER_IMAGE` is used to specify which image & location to use.
  This variable can be specified in front of the `docker compose` command.

  ```bash
  DOCKER_IMAGE=wanchic/wanchic-portfolio docker compose --profile web-image up -d
  ```

* `DOCKER_IMAGE_VERSION` is used to specify which image version to use.
  This variable can be specified in front of the `docker compose` command.

  ```bash
  DOCKER_IMAGE_VERSION=latest docker compose --profile web-image up -d
  ```

### Docker WebApp - Accessing the main app

* Rails App was been setup on port 3034 `DOCKER_WEB_APP_PORT`, but can be changed:
    * <http://127.0.0.1:3034>
    * <http://0.0.0.0:3034>
    * <http://localhost:3034>

### Accessing Docker images at runtime

#### To create a new instance of the image

* Accessing `bash`

  ```bash
  docker run --entrypoint /bin/bash -it wanchic-portfolio-web_build
  ```

#### To access the image currently running

* `CLI bash`

  ```bash
  docker exec -it wanchic-portfolio-web_build-1 /bin/bash
  ```

* `rails console`

  ```bash
  docker exec -it wanchic-portfolio-web_build-1 bin/rails console
  ```

### Linting Dockerfile

* Run:

  ```bash
  docker run --rm -i hadolint/hadolint < Dockerfile
  ```
