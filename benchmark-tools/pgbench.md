

prerequisite 
* install postgresql-contrib 
```
yum instal postgresql-contrib 
```

1. Set the necessary environment variables. 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pgsql/lib
export PATH=$PATH:/usr/local/pgsql/bin/
 
2. Run the pgbench initialization on your Amazon Aurora database instance. The following command loads a 

pgbench database using a scale factor of 10000, vacuums the resulting data, and then indexes it: 

```
pgbench -i -F 90 -s 10000 --host=<rds-aurora-instance-host-name> \
--username=<db-username> postgres
```


3. Run the pgbench read/write workload using the following command: 

```
pgbench --host=<rds-aurora-instance-host-name> --username=<db-username> \
--protocol=prepared -P 60 --time=3600 --client=2048 --jobs=2048 postgres
```



