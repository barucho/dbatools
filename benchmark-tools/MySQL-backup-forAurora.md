

#How to backup MySQL to later recover to aurora 


https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.ExtMySQL.html



```
xtrabackup --user root --password Aa123456! --backup --stream=xbstream --compress ./ > backup.xbstream
```