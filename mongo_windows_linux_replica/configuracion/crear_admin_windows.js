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
sleep(2000);