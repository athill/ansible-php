# transferring certs

1. Zip up the `/etc/letsencrypt/live` and `/etc/letsencrypt/archive` directories and copy to new machine
1. Comment out "run letsencrypt" task in `roles/site/tasks/ssl.yml`
1. Run `ansible-playbook --ask-become-pass --extra-vars "hosts=<host>" sites.yml`