#!/bin/bash

#Start and supervise postgres, redis and memcache
supervisord

#Start push server in the background
sudo -u whisper java -jar Push-Server-0.12.0-capsule-fat.jar server config/pushconfig.yml &

#Wait until push server is running
sleep 5

#Migrate database (needed on first run at least)
sudo -u whisper java -jar TextSecureServer-*.jar accountdb migrate config/tsconfig.yml
sudo -u whisper java -jar TextSecureServer-*.jar messagedb migrate config/tsconfig.yml

#Start TextSecure server
sudo -u whisper java -jar TextSecureServer-*.jar server config/tsconfig.yml
