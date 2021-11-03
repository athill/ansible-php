# ansible-php

Ansible playbooks to set up LEMP server and publish git repo

## technologies
- ansible
- letsencrypt
- mysql
- nginx
- php
- laravel
- node

## standard usage

### set up host
Values for hosts are `production` and `test`.
```
ansible-playbook --ask-become-pass --extra-vars "hosts=production" setup.yml
```

### install packages
Values for hosts are `production` and `test`.
```
ansible-playbook --ask-become-pass --extra-vars "hosts=production" packages.yml
```

### set up web sites
Values for hosts are `production` and `test`.
```
ansible-playbook --ask-become-pass --extra-vars "hosts=production" sites.yml
```

## playbooks
- setup.yml: runs as root, sets up deploy user, disables root ssh, sets up firewall, etc.
- packages.yml: runs as deploy, installs and configures letsencrypt, mysql, nginx, nodejs, php, etc.
- sites.yml: runs as deploy, deploys web sites and installs script to deploy websites

My architecture is somewhat convoluted or appears to be against the Ansible way. All playbooks expect a `-e 'hosts=<hosts>'` argument. There is a hosts file that has groups for snd, test, and production, and `group_vars` files for each of those groups 

## variables
| variable | description |
|----------|-------------|
|app_debug| used in laravel .env files to turn debugging on and off |
|app_env| used in laravel .env files to set the application environment, e.g., develop, production |
|backup_dir| root directory for mysql backups |
|db_root_password| password for mysql root user |
|deploy_password| password for deploy user |
|deploy_public_keys| list of paths of public keys to allow ssh access for deploy user |
|deploy_user_name| username for deploy user |
|mosh_from_port| from port for mosh ssh client |
|mosh_to_port| to port for mob ssh client |
|node_build_command| build command for npm, e.g., `npm run develop` |
|node_version| version of nodejs to install e.g., v10.0.0 |
|optional_packages| Packages that can be overriden by host/group. I got this from https://ryaneschinger.com/blog/securing-a-server-with-ansible/ |
|php_version| version of php to install (e.g., `7.2`) |
|report_email| email to send reports to |
|repo_version| branch, tag, etc. of code repository |
|required_packages| Packages that will be installed on every server |
|root_password| password for root user on machine |
|web_dir| root for websites, e.g., `/var/www` |



