#!/bin/bash   


cd "/home/centos/replica_mongo/mongo_windows_linux_replica"

echo "Creando carpetas..."
mkdir data
mkdir logs
mkdir data/mongod1
mkdir data/mongod2
mkdir data/mongod3
mkdir data/mongod4
mkdir data/mongod5

echo "Corriendo procesos mongod..."
mongod --config configuracion/mongod1_replica1.conf
mongod --config configuracion/mongod2_replica1.conf
mongod --config configuracion/mongod3_replica1.conf
mongod --config configuracion/mongod4_replica1.conf
mongod --config configuracion/mongod5_replica1.conf

#echo "Esperando 8 segundos..."
#sleep 8

#echo "Configurando REPLICA SET..."

#mongo --port 27001 configuracion/iniciar_replica.js

#sleep 5

echo "Creando usuario Admin..." 
#mongo --port 27001 configuracion/crear_admin_windows.js

echo "Now run:"
echo "  mongo -u soporteDBAjar -p jarojas94 --authenticationDatabase admin --port 27001"


#mongo "mongodb://127.0.0.1:27001,127.0.0.1:27002,127.0.0.1:27003/admin?replicaSet=replica1"