# Eric Wanchic's Online Portfolio - Rails Web Application

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

<img src="https://github.com/wanchic/wanchic-portfolio/actions/workflows/cd_docker_buildx_push.yml/badge.svg"><br>

</td>

</tr>
</table>

## Prerequisite OS Setup

* [Ubuntu - README-Ubuntu Setup](README-Ubuntu-Setup.md)

## Download

* Create & Setup your SSH keys on Github

* Download `wanchic-portfolio`

  ```bash
  git clone git@github.com:wanchic/wanchic-portfolio.git
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

### git pre-hooks

* Install `lefthook` git hooks

  ```bash
  lefthook install
  ```

### Node Packages

* Install `npm` packages

  ```bash
  npm install
  ```
