# Eric Wanchic's Online Portfolio

<table>
<tr>
<th>📊 Project</th>
<th>✅ CI</th>
<th>🧹 Linting</th>
<th>📦 Repository</th>
</tr>

<tr>

<td valign="top">

<img src="https://img.shields.io/badge/Ruby-4.0.1-red"><br>
<img src="https://img.shields.io/badge/Rails-8.1.2-red"><br>
<img src="https://img.shields.io/github/license/wanchic/wanchic-portfolio">

</td>

<td valign="top">

<img src="https://img.shields.io/badge/code%20style-linted-brightgreen"><br>

</td>

<td valign="top">

<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/rubocop.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/eslint.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/stylelint.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/yamllint.yml/badge.svg"><br>
<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/jsonlint.yml/badge.svg">

</td>

<td valign="top">

<img src="https://img.shields.io/github/last-commit/wanchic/wanchic-portfolio"><br>
<img src="https://img.shields.io/github/repo-size/wanchic/wanchic-portfolio"><br>
<img src="https://img.shields.io/github/issues/wanchic/wanchic-portfolio">

</td>

</tr>
</table>

## Prerequisite OS Setup

### Ubuntu

#### JSON & YAML Linters

  ```bash
  sudo apt install jq yamllint
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

* Install `npm` packages

  ```bash
  npm install
  ```
