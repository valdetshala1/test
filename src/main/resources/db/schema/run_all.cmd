@echo off
SET client_encoding = 'UTF8';

set server=localhost
set PGUSER=postgres
set PGPASSWORD=KF!$Dbp9
set PGBIN=C:\kfis2.0\apps\pgsql\bin
set dbname=kfis
set port=5432



"%PGBIN%\psql" -U %PGUSER% -h %server%  -p %port% -f kfis_db.sql -d %dbname%

REM f we want to open multiple command prompt then we shd use start cmd /k 
REM start cmd /k Call rc_hub.bat 4444
REM call ..\data\rum_import_data.cmd
cd ..\data
start cmd /k Call rum_import_data.cmd
cd ..\schema

pause