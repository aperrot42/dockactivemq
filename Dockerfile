FROM openjdk:11

# AMQP
EXPOSE 5671
# Web ui
EXPOSE 8161

COPY apache-activemq-5.17.0/ /activemq
COPY activemq.conf.xml /activemq/conf/myconf.xml
#ENV ACTIVEMQ_HOME=/activemq

# copy keystore and trust-store
COPY broker.ks /activemq/conf/broker.ks
COPY broker.ts /activemq/conf/broker.ts

WORKDIR /activemq
ENTRYPOINT [ "./bin/activemq" ]
CMD [ "console", "xbean:file:/activemq/conf/myconf.xml"]