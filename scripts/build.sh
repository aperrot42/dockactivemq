#!/bin/sh

echo "\n--> downloading activemq\n"
wget https://dlcdn.apache.org/activemq/5.17.0/apache-activemq-5.17.0-bin.tar.gz
tar -xvf apache-activemq-5.17.0-bin.tar.gz && rm apache-activemq-5.17.0-bin.tar.gz

echo "\n--> creating certificates and key\n"
./scripts/create-store.sh

echo "\n--> buidling docker image with activemq\n"
docker build . --tag activemq-ssl:latest

rm -rf apache-activemq-5.17.0

echo "\n--> done you can run your broker with the following command \"docker run -p 5671:5671 --rm activemq-ssl:latest\"\n"