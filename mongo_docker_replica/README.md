
# Iniciar docker-compose up -d
# Reiniciar down.sh


docker exec -it mongod1_replica1 bash
mongo


cfg={
    _id:"replica1",
    members:[
        {_id:0, host:" mongo1:27017"},
        {_id:1, host:" mongo2:27017"},
        {_id:2, host:" mongo3:27017"},
        {_id:3, host:" mongo4:27017"}
    ]
}


rs.initiate(cfg);




admin = db.getSiblingDB("admin");
admin.createUser(
  {
    user: "soporteDBAjar",
    pwd: "jarojas94",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" },
    	{ role: "dbAdminAnyDatabase", db: "admin" },
    	{ role: "readWriteAnyDatabase", db: "admin" },
    	{ role: "clusterAdmin", db: "admin" }
    ]
  }
);

db.grantRolesToUser(
    "soporteDBAjar",
    [
      { role: "clusterAdmin", db: "admin" }
    ]
)

mongo -u "soporteDBAjar" -p "jarojas94" --authenticationDatabase "admin" --port 27001
mongo -u "soporteDBAjar2" -p "jarojas94" --authenticationDatabase "admin" --port 27001




mongoexport -u "soporteDBAjar" -p "jarojas94" --host localhost --port 27001 --authenticationDatabase "admin" --db primerBD --collection carritos --verbose --type json --pretty --out export.json
mongoexport -u "soporteDBAjar" -p "jarojas94" --host localhost --port 27001 --authenticationDatabase "admin" --db primerBD --collection carritos --verbose --type csv --fields nombre,_id --out export.csv


mongoimport -u "soporteDBAjar" -p "jarojas94" --host localhost --port 27001 --authenticationDatabase "admin" --db primerBD --collection carritos2 --verbose --type json --file export.json
mongoimport -u "soporteDBAjar" -p "jarojas94" --host localhost --port 27001 --authenticationDatabase "admin" --db primerBD --collection carritos3 --verbose --type csv --headerline --file export.csv


mongoimport --db users --collection contacts --type csv --headerline --file 
