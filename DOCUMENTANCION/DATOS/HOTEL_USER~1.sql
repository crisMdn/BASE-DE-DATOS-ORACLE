SELECT table_name, num_rows FROM user_tables;


--CREACION PARA DIRECTORIA A BACKUPS
CREATE OR REPLACE DIRECTORY BACKUP_DIR AS 'C:\oracle_backups';

--PERMISO AL USER PARA CREARLO Y ENVIARLO 
GRANT READ, WRITE ON DIRECTORY BACKUP_DIR TO C##HOTEL_USER;

SELECT COUNT(*) FROM habitaciones;
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('C##HOTEL_USER');



--ESTO DEBO PEGARLO EN CMD PARA CREAR EL BACKUP LOGICO 
expdp C##HOTEL_USER/canelo123@XE schemas=C##HOTEL_USER directory=BACKUP_DIR dumpfile=backup_hotel_user.dmp logfile=backup_hotel_user.log

expdp C##HOTEL_USER/canelo123@XE schemas=C##HOTEL_USER directory=BACKUP_DIR dumpfile=backup_hotel_user.dmp logfile=backup_hotel_user.log
--SCRIP PARA VERIFICAR SI EXITE EL DIRETORIO 
SELECT DIRECTORY_NAME, DIRECTORY_PATH FROM ALL_DIRECTORIES;

CREATE TABLE C##HOTEL_USER.CLIENTES AS SELECT * FROM SYSTEM.CLIENTES;


SELECT owner, table_name FROM all_tables WHERE table_name LIKE '%';

SELECT owner, table_name FROM all_tables WHERE table_name = 'CLIENTES';


--DEBO DARLE PERMISO PARA USAR EL ESPACIO DE TABLASPACE 
ALTER USER C##HOTEL_USER QUOTA UNLIMITED ON USERS;


--este scrip siempre en cmd e servira para recuperar mi backup
impdp C##HOTEL_USER/canelo123@XE schemas=C##HOTEL_USER directory=BACKUP_DIR dumpfile=backup_hotel_user.dmp logfile=import_hotel_user.log


--sobreescribir el back
expdp C##HOTEL_USER/canelo123@XE schemas=C##HOTEL_USER directory=BACKUP_DIR dumpfile=backup_hotel_user.dmp logfile=backup_hotel_user.log reuse_dumpfiles=YES


ALTER USER C##TESTBACKUP QUOTA UNLIMITED ON SYSTEM;







CREATE USER C##testbackup IDENTIFIED BY test123;
GRANT CONNECT, RESOURCE TO C##testbackup;
ALTER USER C##testbackup DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

GRANT READ, WRITE ON DIRECTORY BACKUP_DIR TO C##testbackup;

impdp C##testbackup/tu_clave@XE schemas=SYSTEM remap_schema=SYSTEM:C##testbackup directory=BACKUP_DIR dumpfile=backup_system.dmp logfile=import_test.log


