#!/bin/sh

# this is using https://activemq.apache.org/how-do-i-use-ssl

# prerequisite : keystore tool from jdk

echo 'creating broker cert (first name is hostname)'
keytool -genkey -alias broker -keyalg RSA -keystore broker.ks

echo 'extract broker cert to broker_cert'
keytool -export -alias broker -keystore broker.ks -file broker_cert

echo 'creating keystore client.ks'
keytool -genkey -alias client -keyalg RSA -keystore client.ks

echo 'creating trust store client.ts adding broker_cert'
keytool -import -alias broker -keystore client.ts -file broker_cert

echo 'created client.ks keystore and client.ts truststore containing broker_cert'

echo 'extract client cert to client_cert'
keytool -export -alias client -keystore client.ks -file client_cert

echo 'add client_cert to broker trust store broker.ts'
keytool -import -alias client -keystore broker.ts -file client_cert
