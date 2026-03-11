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
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/ci_rspec_test.yml/badge.svg"><br>

</td>

<td valign="top">

<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_bash.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_css_sass.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_docker.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/lint_haml.yml/badge.svg"><br>
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

#### Data (Volume) Storage

* Docker data is stored in the local directory at `./tmp/docker-data`.
* This is by design so all data can be erased easily, if need be.
* This can be modified at `DOCKER_VOLUMES_ROOT`
* Each service that stores their data include:
    * `DOCKER_PG_VOLUME` = postgresql

#### Tools for Accessing the Databases

* Each of the databases should be accessible via the
  `user`/`password`/`port` info provided in the `.env`
    * PostgreSQL - [pgAdmin 4](https://www.pgadmin.org/download/),
      [psql (cli)](https://www.postgresql.org/docs/current/app-psql.html),
      [Other Clients](https://wiki.postgresql.org/wiki/PostgreSQL_Clients)

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
  CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS         PORTS                                                  NAMES
  413912da0a45   wanchic-portfolio-web_build   "/rails/bin/docker-e…"   9 seconds ago   Up 9 seconds   0.0.0.0:3034->3000/tcp                                 wanchic-portfolio-web_build-1
  3e30dde7c5d6   postgres:18.3                 "docker-entrypoint.s…"   3 seconds ago   Up 2 seconds   5432/tcp, 0.0.0.0:5440->5440/tcp, [::]:5440->5440/tcp  wanchic-portfolio-postgres-1
  ```

#### Database(s) Setup

* Setup Main DB on PostgreSQL `portfolio`

  ```bash
  docker exec wanchic-portfolio-web_build-1 rails db:create
  ```

## Using Docker Compose

* The base of running docker compose is: `docker compose up`
  However, the **Web App** will not launch by this alone.
* Various profiles and flag switches will
  need to be added in order for a successful run
* TL;DR: To get started with the way wanchic-portfolio was intended, execute:

  ```bash
  bin/docker-build-deps
  docker compose --profile full-build up --build --force-recreate
  ```

* Continue reading to understand how to customize docker for your needs

### Selecting Profiles

* It is important to select a compose profile.
  Compose Profiles enables select services to launch.

* If you want to utilize select service(s) in your local environment,
  using certain profiles is where you customize these.

* Selecting no profiles will not start any services.

* The following is the current Profile Matrix of Service Profiles.

  | _-- Services --_   | dbs | full-build | full-image | full-build-pro  | full-image-pro |
  |--------------------|-----|------------|------------|-----------------|----------------|
  | web-build  _(dev)_ |     | [x]        |            |                 |                |
  | web-image  _(dev)_ |     |            | [x]        |                 |                |
  | web-build-pro      |     |            |            | [x]             |                |
  | web-image-pro      |     |            |            |                 | [x]            |
  | postgres           | [x] | [x]        | [x]        | [x]             | [x]            |

### Running a Service Profile

* The first column in the Profile Matrix lists all the individual service profiles.

* To bring up the `web-image` service:

  ```bash
  docker compose --profile web-image up
  ```

* To bring up the `web-image` service as a daemon:

  ```bash
  docker compose --profile web-image up -d
  ```

* To view the logs of `web-image` service:

  ```bash
  docker compose --profile web-image logs -f
  ```

* To spin down the `web-image` service:

  ```bash
  docker compose --profile web-image down
  ```

### Build vs Image

* The `build` and `image` profiles are suffixed into two categories: **_-build_** and **_-image_**.

### Development vs Production

* `web-build` & `web-image` will both run in `development` RAILS Environment
* `web-build-pro` & `web-image-pro` will both run in `production` RAILS Environment

#### As a Build

* The most simple way to build and launch a fresh image add the `--build` switch

  ```bash
  docker compose --profile full-build up -d --build
  ```

* However, you may experience times when changes in your code are not showing up.
  To prevent this, always add a `--force-recreate` to your command

  ```bash
  docker compose --profile full-build up -d --build --force-recreate
  ```

#### As an Image

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

## Developing with Docker

### Running Docker as a Build from local

* Running for the 1st time, or needing to rebuild

  ```bash
  bin/docker-build-deps
  docker compose --profile web-build up --build --force-recreate
  ```

* Running without needing to rebuild

  ```bash
  docker compose  --profile web-build up -d
  ```

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
