# scp  new-server-setup.sh root@host:~
# ssh root@host
# sh new-server-setup.sh

# set up user
adduser athill
gpasswd -a athill sudo

# no root ssh
sed -ri 's/^(PermitRootLogin)(\s+)yes/\1 no/' /etc/ssh/sshd_config
service ssh restart

# instructions for setting up passwordless ssh on client
echo "Run this from the client and deploy.wimf.space to enable passwordless ssh:"
echo "cat ~/.ssh/id_rsa.pub | ssh athill@"$(hostname)" 'mkdir -p ~/.ssh; cat >> .ssh/authorized_keys'"

