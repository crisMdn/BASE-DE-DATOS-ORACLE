-- FUNCIÓN 1: Calcular monto total de pagos por cliente
CREATE OR REPLACE FUNCTION total_pagado (p_dui_cliente VARCHAR2)
RETURN NUMBER IS
    total NUMBER := 0;
BEGIN
    SELECT SUM(p.monto)
    INTO total --INGRESAR A COLUMNA NUEVA LLMADA TOTAL 
    FROM PAGOS p --DESDE LA TABLA PAGOS CON EL SINONIMO P 
    JOIN RESERVAS r ON p.num_reserva = r.num_reserva
    WHERE r.dui_cliente = p_dui_cliente;
    RETURN NVL(total, 0);
END;
/