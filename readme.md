# ansible-php

Ansible playbooks to set up LEMP server and publish git repo

## technologies
- ansible
- mysql
- nginx
- php
- laravel
- node

## roles
- common: removes root ssh, sets up firewall, creates swap, installs git and ntp
- mysql: install mysql-5.7, create application database and user
- php: install and configure php and nginx, clones git repo, runs composer, copies templated .env file, runs artisan migrate
- node: installs nodejs and npm, runs npm install, webpack, and gulp less
- home: .gitconfig, .git-completion, .bash_profile, deploy script
- letsencrypt: Installs SSL cert on nginx server

## variables

### app settings
- app_name: name of app
- project_dir: root directory of project
- repo_url: url of git repository
- app_env: environment in .env
- app_debug: whether to allow debugging in .env
- github_oauth_key: github key for composer
- host: host name
- repo_version: branch, tag, or sha-1 hash to clone from

### db settings
- db_root_password: root password for mysql
- db_database: app database name
- db_user: app database user username
- db_password: app database user password


### mail settings
- mail_driver: driver in laravel mail config
- mail_host: host in laravel mail config
- mail_port: port in laravel mail config
- mail_username: username in laravel mail config
- mail_password: password in laravel mail config
- mail_encryption: encryption in laravel mail config
- mailgun_domain:  mailgun domain in laravel services config
- mailgun_secret: mailgun secret in laravel services config

### user settings
- user_dir_path: path to user directories (generally /home)
- user: username of user
- user_dir: "{{user_dir_path}}/{{user}}"
- user_email: email for user
- user_name: name of user



