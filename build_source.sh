#!/usr/bin/env bash

git clone https://github.com/WhisperSystems/WebSocket-Resources.git
cd WebSocket-Resources && mvn install -Dskiptest

git clone https://github.com/WhisperSystems/dropwizard-simpleauth.git
cd dropwizard-simpleauth && mvn install -Dgpg.skip

git clone https://github.com/WhisperSystems/TextSecure-Server.git
cd TextSecure-Server &&  git checkout v0.54 && mvn install

git clone https://github.com/WhisperSystems/PushServer.git
cd PushServer && git checkout v0.9.8 && mvn install

cp /home/whisper/TextSecure-Server/target/TextSecureServer-0.54.jar /home/whisper
cp /home/whisper/PushServer/target/Push-Server-0.9.8-capsule-fat.jar /home/whisper
