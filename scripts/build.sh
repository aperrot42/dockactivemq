#!/bin/sh

# get ActiveMq
echo "downloading activemq"
wget https://dlcdn.apache.org/activemq/5.17.0/apache-activemq-5.17.0-bin.tar.gz
tar -xvf apache-activemq-5.17.0-bin.tar.gz && rm apache-activemq-5.17.0-bin.tar.gz

echo "create certificates and key"
./scripts/create-store.sh

echo "buidling docker image with activemq"
docker build . --tag activemq-ssl:latest

rm -rf apache-activemq-5.17.0

echo "done you can run your broker with the following command \"docker run -p 5671:5671 --rm activemq-ssl:latest\""