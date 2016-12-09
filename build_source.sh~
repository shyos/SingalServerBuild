#!/usr/bin/env bash

# git clone https://github.com/WhisperSystems/WebSocket-Resources.git
git clone https://github.com/fabiofumarola/WebSocket-Resources.git
cd WebSocket-Resources && git checkout v0.3.2 && mvn install -Dskiptest && cd ..

# git clone https://github.com/WhisperSystems/dropwizard-simpleauth.git
git clone https://github.com/fabiofumarola/dropwizard-simpleauth.git
cd dropwizard-simpleauth && mvn install -Dgpg.skip && cd ..

git clone https://github.com/WhisperSystems/TextSecure-Server.git
cd TextSecure-Server &&  git checkout v0.54 && mvn install && cd ..

git clone https://github.com/fabiofumarola/PushServer.git
cd PushServer && git checkout v0.9.8.1 && mvn install && cd ..

cp /home/whisper/TextSecure-Server/target/TextSecureServer-0.54.jar /home/whisper
cp /home/whisper/PushServer/target/Push-Server-0.9.8-capsule-fat.jar /home/whisper
