# Dockerized ACTIVEMQ 

This repo contains some scripts to create a quick activeMq docker image.

It allows to create an activeMq broker with self generated ssl certificates.

# usage

Custmize your activemq configuration file : `activemq.conf/xml`

You need to set ssl configuration lines 114-119 : do not forget to use the keystore and trustore password you used while creating self signed certificates.

```
./scripts.build.sh
```

# resources

This was build by following this wiki : https://cwiki.apache.org/confluence/display/ACTIVEMQ/How+do+I+use+SSL