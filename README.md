# Eric Wanchic's Online Portfolio

## Prerequisite OS Setup

### Ubuntu

#### JSON

  ```bash
  sudo apt install jq
  ```

#### CSS, SCSS, & SASS

  ```bash
  npm install --save-dev \
    stylelint \
    stylelint-config-standard \
    stylelint-config-standard-scss \
    stylelint-scss
  ```

#### Javascript

  ```bash
  npm install --save-dev eslint
  ```

#### YAML

  ```bash
  sudo apt install yamllint
  ```

## Install Application Dependencies

### Ruby & Rails Gems

* Install bundler if not already installed

  ```bash
  gem install bundler
  ```

* Install bundled gem dependencies

  ```bash
  bundle install
  ```

* Install `lefthook` git hooks

  ```bash
  lefthook install
  ```
