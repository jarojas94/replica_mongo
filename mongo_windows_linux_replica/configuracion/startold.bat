@echo off
rem M102 Final
rem Script to make a test replica set. See problem #1.

rem if you need to start over try:
rem rmdir data /s
rem (careful that deletes that everything under data/ recursively!)

rem we expect nothing to be running.  
rem you might have a mongo shell running which is ok...but 
rem no mongod or mongos processes.

echo Creando carpetas...
mkdir data
mkdir data\
mkdir data\a1
mkdir data\a2

mkdir data\b0
mkdir data\b1
mkdir data\b2

mkdir data\c0
mkdir data\c1
mkdir data\c2

mkdir data\d0
mkdir data\d1
mkdir data\d2

mkdir data\cfg0
mkdir data\cfg1
mkdir data\cfg2

echo Corriendo procesos mongod...

start mongod --config mongod_cfg.conf --dbpath data/cfg0 --port 26050 --logpath log.cfg0 --logappend
start mongod --config mongod_cfg.conf --dbpath data/cfg1 --port 26051 --logpath log.cfg1 --logappend
start mongod --config mongod_cfg.conf --dbpath data/cfg2 --port 26052 --logpath log.cfg2 --logappend

start mongod --config mongod_shda.conf --dbpath data/a0 --logpath log.a0 --port 27000 --oplogSize 50 
start mongod --config mongod_shda.conf --dbpath data/a1 --logpath log.a1 --port 27001 --oplogSize 50 
start mongod --config mongod_shda.conf --dbpath data/a2 --logpath log.a2 --port 27002 --oplogSize 50 

start mongod --config mongod_shdb.conf --dbpath data/b0 --logpath log.b0 --port 27100 --oplogSize 50 
start mongod --config mongod_shdb.conf --dbpath data/b1 --logpath log.b1 --port 27101 --oplogSize 50 
start mongod --config mongod_shdb.conf --dbpath data/b2 --logpath log.b2 --port 27102 --oplogSize 50 

start mongod --config mongod_shdc.conf --dbpath data/c0 --logpath log.c0 --port 27200 --oplogSize 50 
start mongod --config mongod_shdc.conf --dbpath data/c1 --logpath log.c1 --port 27201 --oplogSize 50 
start mongod --config mongod_shdc.conf --dbpath data/c2 --logpath log.c2 --port 27202 --oplogSize 50 

start mongod --config mongod_shdd.conf --dbpath data/d0 --logpath log.d0 --port 27300 --oplogSize 50 
start mongod --config mongod_shdd.conf --dbpath data/d1 --logpath log.d1 --port 27301 --oplogSize 50 
start mongod --config mongod_shdd.conf --dbpath data/d2 --logpath log.d2 --port 27302 --oplogSize 50 

start mongos --config mongos.conf --logappend --logpath log.mongos0 
start mongos --config mongos.conf --logappend --logpath log.mongos1 --port 26061
start mongos --config mongos.conf --logappend --logpath log.mongos2 --port 26062
start mongos --config mongos.conf --logappend --logpath log.mongos3 --port 26063



rem give them time to start. note this might not be enough time!
sleep 1

echo "Now run:"
echo "  mongo --shell --port 27003 a.js"

rem Tip: in powershell, list all mongo processes with:
rem        ps mongo*
rem      and you can terminate them all with:
rem        ps mongo* | kill
