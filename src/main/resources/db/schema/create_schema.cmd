@echo off
SET client_encoding = 'UTF8';

set server=localhost
set PGUSER=postgres
set PGPASSWORD=KF!$Dbp9
set PGBIN=C:\kfis2.0\apps\pgsql\bin
set dbname=kfis
set port=5432



"%PGBIN%\psql" -U %PGUSER% -h %server%  -p %port% -f kfis_db.sql -d %dbname%




pause