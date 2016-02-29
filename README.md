Docker container to run TextSecure server
-----------------------------------------

This is a docker to build your own TextSecure server. You can find the latest pre-build jars in the java folder.

## Build

To build the image run
```bash
docker build -t textsecure/server .
```
This command will package all the required deps. Feel free to split the various dependencies in several docker.

## Run

To run the image

```bash
docker run -d -p 8080:8080 -p 8081:8081 -v <your configs>:/home/whisper/config textsecure/server
```

Required services to be configured:

- Twilio: for sms broadcasting(for registration in TextServer),
- AWS S3: for documents in TextSecure,
- Google developer: for push notifications,
- Apple Developer: for push notifications


### Using https

You can generate a root CA, host key and certificates and keystores for the server
using the gencert scripts, for example if your server is running on 192.168.1.100 run

```bash
ALTNAME=IP:192.168.1.100 ./gencerts
```

Copy the resulting example.keystore to config/ as referenced by tsconfig.yml and
the rootCA.crt file to the client (pointed at by the rootCA config item in the Go client).
