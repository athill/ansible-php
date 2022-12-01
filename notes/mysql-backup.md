# mysql-backup



```bash
# backup
mysqldump -u root -p wimf > wimf_backup.sql

# restore
mysql -u root -p wimf < wimf_backup.sql
```