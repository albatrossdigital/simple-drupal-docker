# simple-drupal-docker
Super simple docker setup for Drupal sped up by docker-sync

### Requirements:

- docker
- docker-compose
- docker-sync (http://docker-sync.io/) `gem install docker-sync`

### How to use

1. `git clone git@github.com:albatrossdigital/simple-drupal-docker.git MYPROJECT` create your repo
2. Search replace in folder for `REPLACEME` with `MYPROJECT`
3. `cd MYPROJECT` and `git clone {your drupal project} ./src` get your drupal repo
4. Add include to settings.php
   ```
   // Include file for docker database connection.
   if (file_exists('/var/www/.docker/etc/settings.docker.php')) {
      require '/var/www/.docker/etc/settings.docker.php';
   }
   ```
5. Download a db.sql to `./src`
6. Spin up `docker-sync start` from MYPROJECT, this will rsync files from ./src to the container, then watch files for further syncing
7. `docker-compose up -d` start the drupal + db containers
8. `docker exec -it MYPROJECT_web_1 bash` ssh into container
9. Load in your db.sql
   ```
   drush sqlc
   > use drupal
   > source db.sql
   ```
10. Now any changes made on local filesystem are rsync'd to the MYPROJECT-native-osx-sync container for quick execution