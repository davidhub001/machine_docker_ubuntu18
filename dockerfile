# Utilisation de l'image Ubuntu 18.04 comme base
FROM ubuntu:18.04

# Éviter les demandes interactives pendant l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Mise à jour des packages et installation d'Apache, PHP, PHPMyAdmin et MySQL
RUN apt-get update && apt-get install -y apache2 && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && apt-get install -y php7.2 php7.2-mysql && \
    apt-get install -y phpmyadmin mysql-server && \
    apt-get install -y php-soap

# Configuration de phpMyAdmin et Apache si nécessaire
RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Création du fichier de configuration Apache 000-default.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Exposition des ports 80 (Apache) et 3306 (MySQL)
EXPOSE 80
EXPOSE 3306

# Commande pour démarrer Apache et MySQL, créer la base de données et importer les données
CMD service apache2 start && service mysql start && \
    mysql -u root -e "CREATE USER 'david'@'localhost' IDENTIFIED BY 'david123+';" && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'david'@'localhost' WITH GRANT OPTION;" && \
    tail -f /dev/null
