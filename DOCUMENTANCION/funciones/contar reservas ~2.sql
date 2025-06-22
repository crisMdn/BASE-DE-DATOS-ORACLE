-- FUNCIÓN 2: Contar reservas por cliente
CREATE OR REPLACE FUNCTION contar_reservas (p_dui_cliente VARCHAR2)
RETURN NUMBER IS
    cantidad NUMBER := 0;
BEGIN
    SELECT COUNT(*)
    INTO cantidad
    FROM RESERVAS
    WHERE dui_cliente = p_dui_cliente;
    RETURN cantidad;
END;


