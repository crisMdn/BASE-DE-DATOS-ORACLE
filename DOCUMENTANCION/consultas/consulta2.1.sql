--busqueda especifica con join cliente reserva 
SELECT C.nombre, R.num_reserva
FROM CLIENTES C
JOIN RESERVAS R ON C.dui = R.dui_cliente
WHERE C.dui = '06375632-7';


--actualizar precio de habitaciones tipo doble 
UPDATE HABITACIONES
SET precio = precio + 10
WHERE tipo = 'Doble';

--eliminar pagos menores a diez pesos 
DELETE FROM PAGOS
WHERE monto < 10;

--busqueda de reservas futuras por tipo de habitacion 
SELECT R.num_reserva, H.tipo
FROM RESERVAS R
JOIN HABITACIONES H ON R.num_habitacion = H.num_habitacion
WHERE R.fecha_entrada > SYSDATE;


--cliente que no ha pagado 
SELECT C.dui, C.nombre
FROM CLIENTES C
WHERE C.dui NOT IN (
    SELECT R.dui_cliente
    FROM RESERVAS R
    JOIN PAGOS P ON R.num_reserva = P.num_reserva
);
