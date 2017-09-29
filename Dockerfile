FROM drupal:7-apache

# Add mysql for drush
RUN apt-get update && apt-get install -y mysql-client && rm -rf /var/lib/apt

# Get a global installation of Drush on the web / drupal container
RUN php -r "readfile('http://files.drush.org/drush.phar');" > drush && chmod +x drush && mv drush /usr/bin/ && drush @none dl registry_rebuild-7.x