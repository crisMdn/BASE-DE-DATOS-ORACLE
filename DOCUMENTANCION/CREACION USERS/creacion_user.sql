--creacion de user usando C## prefijo antes del name para evitar configurar
CREATE USER C##cris IDENTIFIED BY cris123;
GRANT CONNECT, RESOURCE TO C##cris;
ALTER USER C##cris DEFAULT TABLESPACE USERS;
ALTER USER C##cris QUOTA UNLIMITED ON USERS;


