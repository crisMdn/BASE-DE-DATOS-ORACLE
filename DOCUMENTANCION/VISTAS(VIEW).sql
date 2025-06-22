--  Vista: Reservas con nombre del cliente y número de habitación
CREATE OR REPLACE VIEW vista_reservas_detalle AS
SELECT 
    R.num_reserva,
    C.nombre AS nombre_cliente,
    R.num_habitacion,
    R.fecha_entrada,
    R.fecha_salida
FROM RESERVAS R
JOIN CLIENTES C ON R.dui_cliente = C.dui;

--  Vista: Resumen de pagos agrupados por tipo de pago
CREATE OR REPLACE VIEW vista_resumen_pagos AS
SELECT 
    tipo_pago,
    COUNT(*) AS cantidad_pagos, --SE CUENTA LOS TIPO DE PAGO Y CONFORME A ESO SE ADJUNTAN A CADA UNO 
    SUM(monto) AS total_pagado
FROM PAGOS
GROUP BY tipo_pago;

--  Vista: Reservas próximas a vencer (dentro de 7 días desde hoy)
CREATE OR REPLACE VIEW vista_reservas_proximas AS
SELECT 
    num_reserva,
    dui_cliente,
    fecha_entrada,
    fecha_salida
FROM RESERVAS
WHERE fecha_salida BETWEEN SYSDATE AND SYSDATE + 7;


--DE ESTA MANERA SE PUEDEN CONSULTAR LA VISTA DE LAS VIEW COMO SOLICITAR LA VISTA A UNA TABLA 

SELECT * FROM vista_reservas_detalle;
SELECT * FROM vista_resumen_pagos;
SELECT * FROM vista_reservas_proximas;
