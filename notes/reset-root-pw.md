# resetting root pw

service mysql stop

mysqld_safe --skip-grant-tables &

mysql -u root

use mysql;

update user set authentication_string=PASSWORD("NEW-ROOT-PASSWORD") where User='root';
update user set plugin="mysql_native_password"; 

flush privileges;

quit

service mysql restart