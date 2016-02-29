sudo apt-get install mysql-server

mysql -uroot -p

mysql> create database homestead;
mysql> CREATE USER 'homestead'@'localhost' IDENTIFIED BY 'secret';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'homestead'@'localhost';



# Might work?
# The problem is that the package manager will ask for a password while installing interactively. But ansible git module does it noninteractively and, somehow, it is giving some answers to those questions, bad ones, wich makes package manager set something (blank? null?) as a password.

# But if we previously give the right ones:

# echo mysql-server mysql-server/root_password password $mysql_root_password | sudo /usr/bin/debconf-set-selections

# It works.
