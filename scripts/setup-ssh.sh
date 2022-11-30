cd ~/.ssh
ssh-keygen -b 2048 -t rsa -f id_rsa -q -N ""
cat id_rsa.pub >> authorized_keys
ssh-agent > ~/.bashrc
. ~/.bashrc
ssh-add id_rsa
