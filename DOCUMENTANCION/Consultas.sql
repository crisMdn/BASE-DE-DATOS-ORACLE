--CONSULTAS 
SELECT * FROM CLIENTES; -- CONSULTA PARA VER LA TABLA DE CLIENTES 

SELECT * FROM RESERVAS WHERE dui_cliente = '06375632-7'; --una consulta a reservas por un cliente especifico usando la claura where 

SELECT * FROM PAGOS WHERE MONTO > 100; --CONSULTA EN LA TABLA PAGOS MONTRAR SI MONTO ES MAYOR A 100

SELECT * FROM HABITACIONES WHERE TIPO = 'Individuales'; --ver todas las habitaciones individuales 

--consulta para ver nombre del cliente y fecha de entrada 
SELECT C.nombre, R.fecha_entrada 
FROM CLIENTES C --uso la tabla clientes he indico que llevara el alias C
JOIN RESERVAS R ON C.DUI = R.dui_cliente; --uso la tabla reservas y su alias es R donde unire con JOIN los datos que coincidan con el dui de Clientes con dui_clientes en reserva 


--VER PAGOS  JUNTO CON TIPO DE HABITACIONES RESERVADAS
SELECT P.ID_PAGO, H.TIPO, P.MONTO ---MIS TITULOS DE CABEZERA 
FROM PAGOS P
JOIN RESERVAS R ON P.NUM_RESERVA = R.NUM_RESERVA 
JOIN HABITACIONES H ON R.NUM_HABITACION = H.NUM_HABITACION; 

--TOTAL DE PAGOS REGISTRADOS 
SELECT SUM(MONTO) AS TOTAL_INGRESO
FROM PAGOS; 

--TOTAL DE PAGOS AGRUPADOS POR SU TIPO 
SELECT tipo_pago, SUM(monto) AS total_por_tipo
FROM PAGOS
GROUP BY tipo_pago; --SIRVE PARA AGRUPAR LOS DATOS 

--CLIENTES QUE AN HECHO MAS DE UNA RESERVA 
SELECT dui_cliente, COUNT(*) AS cantidad_reservas
FROM RESERVAS
GROUP BY dui_cliente
HAVING COUNT(*) > 1; --FILTRO QUE AYUDA A CONTAR MAS DE UNA VEZ SI TIENEN MAS DE UNA RESERVACION 

--CLIENTES QUE HAN REALIZADO UNA RESERVA 
SELECT dui_cliente, COUNT(*) AS cantidad_reservas --CANTIDAD DE RESERVA SERA UNA TABLA DONDE SE ALMACENARA EL CONTEO DE LOS DUI_CLIENTE 
FROM RESERVAS
GROUP BY dui_cliente;






