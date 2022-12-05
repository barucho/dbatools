## sysbench

https://github.com/akopytov/sysbench


Prepare the sysbench benchmark data in your Amazon Aurora database instance. The following command 
will create the test data: 


```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pgsql/lib
export PATH=$PATH:/usr/local/pgsql/bin/
export dbip=pg-bm.sfsdfsdf.us-east-1.rds.amazonaws.com


sysbench --test=/usr/local/share/sysbench/oltp.lua \
--pgsql-host=$dbip --pgsql-db=postgres \
--pgsql-user=postgres --pgsql-password=postgres --pgsql-port=5432 \
--oltp-tables-count=250 --oltp-table-size=450000 prepare

```

Run the write workload on the EC2 sysbench client, using the following command: 

```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pgsql/lib
export PATH=$PATH:/usr/local/pgsql/bin/
export dbip=pg-bm.hostnamesefsf.com


sysbench --test=/usr/local/share/sysbench/oltp.lua \
--pgsql-host=$dbip --pgsql-db=postgres \
--pgsql-user=postgres --pgsql-password=***** --pgsql-port=5432 \
--oltp-tables-count=250 --oltp-table-size=450000 --max-requests=0 --forced-shutdown \
--report-interval=60 --oltp_simple_ranges=0 --oltp-distinct-ranges=0 \
--oltp-sum-ranges=0 --oltp-order-ranges=0 --oltp-point-selects=0 --rand-type=uniform \
--max-time=3600 --num-threads=2048 run

```
## TPCC

https://github.com/Percona-Lab/sysbench-tpcc

## 
```
wget https://github.com/Percona-Lab/sysbench-tpcc/archive/refs/heads/master.zip
```
```
./tpcc.lua --mysql-host=aws-experience.cluster-coyhv9dq128h.us-east-1.rds.amazonaws.com --mysql-password=Aa123456 --mysql-user=admin --mysql-db=sbt --time=300 --threads=10 --report-interval=1 --tables=10 --scale=100 --db-driver=mysql prepare 
```
```
./tpcc.lua --mysql-host=aws-experience.cluster-coyhv9dq128h.us-east-1.rds.amazonaws.com --mysql-password=Aa123456 --mysql-user=admin --mysql-db=sbt --time=300 --threads=64 --report-interval=1 --tables=10 --scale=100 --db-driver=mysql run
```
