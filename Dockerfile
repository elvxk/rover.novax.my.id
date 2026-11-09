FROM php:8.3-apache

# Install OS libraries and required PHP extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libxml2-dev \
    libonig-dev \
    && docker-php-ext-install curl dom mbstring \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Configure Apache VirtualHost with AllowOverride All and FallbackResource
RUN { \
    echo '<VirtualHost *:80>'; \
    echo '    ServerAdmin webmaster@localhost'; \
    echo '    DocumentRoot /var/www/html'; \
    echo '    <Directory /var/www/html>'; \
    echo '        Options -Indexes +FollowSymLinks'; \
    echo '        AllowOverride All'; \
    echo '        Require all granted'; \
    echo '        FallbackResource /index.php'; \
    echo '    </Directory>'; \
    echo '    ErrorLog ${APACHE_LOG_DIR}/error.log'; \
    echo '    CustomLog ${APACHE_LOG_DIR}/access.log combined'; \
    echo '</VirtualHost>'; \
} > /etc/apache2/sites-available/000-default.conf

# Set working directory & copy application code
WORKDIR /var/www/html
COPY . /var/www/html/

# Ensure appropriate web permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
