# Ansible PHP

Ansible playbooks for LEMP/Node setup

## Roles:
 - common: set up git, etc.
 - home: deloy script/config files in user directory
 - mysql: install and set up users and database
 - node: install npm, n, gulp; run npm install, webpack, gulp less
 - php: install and configure php, nginx, composer; clone project, run composer install

 ## Todo
 - [x] letsencrypt
 - [ ] multiple sites