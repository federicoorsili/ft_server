service mysql start
mysql -u root </src/init.sql
rm ./etc/nginx/sites-available/default
cp ./src/default_on ./etc/nginx/sites-available/default
wget http://wordpress.org/latest.tar.gz 
tar xfz latest.tar.gz 
rm latest.tar.gz 
mv wordpress /var/www/html/wordpress
mv ./src/wp-config.php ./var/www/html/wordpress/wp-config.php
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz 
tar xfz phpMyAdmin-5.0.4-all-languages.tar.gz 
rm phpMyAdmin-5.0.4-all-languages.tar.gz 
mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpMyAdmin 

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out ./var/www/html/localhost.crt \
            -keyout ./var/www/html/localhost-key.key \
            -subj "/C=IT/ST=Italy/L=Rome/O=Localhost/OU=IT Department/CN=localhost"
cat ./var/log/nginx/error.log
service php7.3-fpm start
service mysql restart
service nginx start 
