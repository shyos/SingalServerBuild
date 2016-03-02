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
docker run -d -p 8080:8080 -p 8081:8081 -v <your configs folder>:/home/whisper/config -v <your certs folder>:/home/whisper/certs textsecure/docker
```

Required services to be configured:

- Twilio: for sms broadcasting(for registration in TextServer). **Required to start the TextSecure Server.**
- AWS S3: for documents in TextSecure. **Required to start the TextSecure Server.**
- Google developer: for push notifications. **Required to start the PushServer Service.**
- Apple Developer: for push notifications. **Required to start the PushServer Service.**


### Using https

You can generate a root CA, host key and certificates and keystores for the server
using the gencert scripts, for example if your server is running on 192.168.1.100 run

```bash
ALTNAME=IP:192.168.1.100 ./gencerts
```

Copy the resulting example.keystore to config/ as referenced by tsconfig.yml and
the rootCA.crt file to the client (pointed at by the rootCA config item in the Go client).

### Generate Certificate for Apple

Redo the following commands for push and voip
```bash

# create cert.pem
openssl pkcs12 -in archive.p12 -nokeys -out cert.pem

# create private key.pem
# need to enter password
# need to enter passphrase
openssl pkcs12 -in archive.p12 -nocerts -out private_key.pem

# remove passphrase from key
# need to enter passphrase
openssl rsa -in private_key.pem -out private_key.rsa.pem

```

**Rename the generated key and certificate so that the prefix match your appId Name**
I.E. if the id of your app is `com.example.MyApp` the name of the certificates and key files
should be `MyAppWhateverYouWantKey.pem`.
