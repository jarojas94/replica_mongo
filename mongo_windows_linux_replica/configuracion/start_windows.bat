@echo off
rem M102 Final
rem Script to make a test replica set. See problem #1.

rem if you need to start over try:
rem rmdir data /s
rem (careful that deletes that everything under data/ recursively!)

echo Creando carpetas...

mkdir data
mkdir logs
mkdir data\mongod1
mkdir data\mongod2
mkdir data\mongod3
mkdir data\mongod_arbitro

echo Corriendo procesos mongod...

start mongod --config configuracion\mongod1_replica1.conf
start mongod --config configuracion\mongod2_replica1.conf
start mongod --config configuracion\mongod3_replica1.conf
start mongod --config configuracion\mongod_arbitro_replica1.conf

timeout /t 8

echo Configurando REPLICA SET ______________________________________________
mongo --port 27001 configuracion\iniciar_replica.js

echo Ejecute la siguiente linea para crear usuario Admin 
echo "mongo --port 27001 configuracion\crear_admin_windows.js"

echo "Now run:"
echo "  mongo -u soporteDBAjar -p jarojas94 --authenticationDatabase admin --port 27001"

rem Tip: in powershell, list all mongo processes with:
rem        ps mongo*
rem      and you can terminate them all with:
rem        ps mongo* | kill
