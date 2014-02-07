
-- change to the user 'postgres' and connect to the database (unix shell)
sudo -u postgres psql postgres

\l --list all the databases
\du --list all the user roles

-- add a new role
CREATE ROLE demorole1 WITH LOGIN ENCRYPTED PASSWORD 'password1' CREATEDB;

-- change an existing role
ALTER ROLE demorole1 CREATEROLE CREATEDB REPLICATION SUPERUSER;

--Drop an existing user role
DROP ROLE demorole1;

-- create a new database with an owne
CREATE DATABASE demodb1 WITH OWNER demorole1 ENCODING 'UTF8';

-- grant privileges to an existing user role
GRANT ALL PRIVILEGES ON DATABASE demodb1 TO demorole1;

DROP DATABASE demodb1; -- drop a database

\c mydatabase; -- connect to a database
\dt -- list the tables in the currently connected database
\d mytable -- list the columns on a table

-- dump/backup a database (unix shell)
pg_dump mydatabase > some_file_name



