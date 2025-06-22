--------------------------------
--creacion de roles 
-----------------------------------------------
CREATE ROLE C##rol_gestion_hotel;

--VERIFICA EN QUE CONTENEDOR ESTOY TRABAJDO SI EN CDDB-ROOT O PDB
SHOW CON_NAME; 
--------------------------------------------
--otorgacion de privilegios sobre objetos al rol 
-----------------------------------------------
GRANT SELECT, INSERT, UPDATE, DELETE ON CLIENTES TO C##rol_gestion_hotel;
GRANT SELECT, INSERT, UPDATE, DELETE ON RESERVAS TO C##rol_gestion_hotel;
GRANT SELECT, INSERT, UPDATE, DELETE ON HABITACIONES TO C##rol_gestion_hotel;
GRANT SELECT, INSERT, UPDATE, DELETE ON PAGOS TO C##rol_gestion_hotel;


--VER LOS ROLES EXISTENTES 

-- Roles existentes en la base de datos
SELECT * FROM DBA_ROLES;

-- Roles asignados a usuarios
SELECT * FROM DBA_ROLE_PRIVS;

-- Roles asignados al usuario actual
SELECT * FROM USER_ROLE_PRIVS;

--MOSTRAR ROLES SIN TENER DBA 
SELECT * FROM USER_ROLE_PRIVS;

-----------------------------------------------
--creacion del nuevo usuario 
-----------------------------------------------
CREATE USER C##EMPLEADO_1 IDENTIFIED BY empleado123;

------CON ESTE SCRIP PERMITE INICIAR CONEXION AL NUEVO USER 
GRANT CREATE SESSION  TO C##EMPLEADO_1; 

----------------------------------------------------
--permisos para conectar al sistema y crear tablas, crear vistas, crear procedimientos pero no se otorgan permisos sobre tablas existentes. 
GRANT CONNECT, RESOURCE TO C##EMPLEADO_1;
GRANT CONNECT, RESOURCE TO C##rol_gestion_hotel; 


-------------------------------------------
--otorgar rol a usuario 
-------------------------------------------
GRANT C##rol_gestion_hotel TO C##EMPLEADO_1; 

----------------------------------------------
--dar permiso de conexion y espacio (ignorar)
----------------------------------------------
GRANT CONNECT TO C##EMPLEADO_1;
GRANT RESOURCE TO usuario_hotel;

----------------
SELECT table_name FROM user_tables WHERE table_name = 'CLIENTES';



SELECT name FROM v$pdbs;


GRANT CONNECT TO C##EMPLEADO_1 CONTAINER = ALL;
GRANT CREATE SESSION TO C##EMPLEADO_1 CONTAINER = ALL;

