: '
  PG_DUMP For Full Backup Data & Schema
  -s schema only 
  -p port database
  -U username 
  -h host / ip 
  -O no-owner
  -x exclude privileges grant
  -f filename for backup database
'
pg_dump -U postgres -h 127.0.0.1 -p 5432 -d dvdrental -O -x  -f dvdrental_20230702_1239.sql 

: '
  PG_DUMP For Schema Only 
'
pg_dump -U postgres -h 127.0.0.1 -p 5432 -d dvdrental -O -x -s -f dvdrental_schema_only_20230702_1239.sql 

: '
  PG_DUMP For Data Only

'
pg_dump -U postgres -h 127.0.0.1 -p 5432 -d dvdrental -O -x -a  -f dvdrental_data_only_20230707.sql 

: '
  PG_DUMP For Data & Schema Specific Table

'
pg_dump -U postgres -h 127.0.0.1 -p 5432 -d dvdrental -O -x -t actor -f dvdrental_table_actor_full_20230707.sql 

: '
  pg_dumpall for backup the entire database 
'
pg_dumpall -U postgres -h 127.0.0.1 -p 5432 -O -f pg_dumpall_backup1.sql

: '
  Restore Script file into database
'
psql -U postgres -h 127.0.0.1 -p 5432 -d dvdrental_qa < /media/backup/dvdrental_backup1.sql

: '
  Restore Table Only To Another Database 
'

psql -U postgres -h 127.0.0.1 -p 5432 -d dvdrental_qa < /media/backup/dvdrental_table_actor_full_20230707.sql

: '
  Restore Using Backup From pg_dumpall
'
psql -U postgres -h 127.0.0.1 -p 5432 -d dvdrental_qa < /media/backup/pg_dumpall_backup1.sql

: '
  Create Sequence Manually
'
SELECT 'CREATE SEQUENCE ' || c.relname ||' START WITH 1;' FROM pg_class c WHERE c.relkind = 'S';

