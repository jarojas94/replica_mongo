FROM mongo:3.6

COPY /configuracion/mongodb-keyfile.key /etc/mongodb/conf.d/mongodb-keyfile.key

COPY /configuracion/mongod_replica1.conf /etc/mongodb/conf.d/mongod_replica1.conf

RUN chown mongodb:mongodb /etc/mongodb/conf.d/mongodb-keyfile.key && chmod 400 /etc/mongodb/conf.d/mongodb-keyfile.key

WORKDIR /etc/mongodb/conf.d

CMD ["-f","mongod_replica1.conf"]