echo "Creating Maria Db"
if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else
mysql_install_db

service mysql start
# Set root option so that connexion without root password is not possible

mysql_secure_installation <<_EOF_

N
Y
n
Y
Y
_EOF_



#Create database and user for wordpress
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

fi
sleep 2

service mysql stop

exec mysqld_safe --bind-address=0.0.0.0