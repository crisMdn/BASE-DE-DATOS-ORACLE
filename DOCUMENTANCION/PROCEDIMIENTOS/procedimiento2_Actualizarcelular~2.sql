-- PROCEDIMIENTO 2: Actualizar teléfono del cliente
CREATE OR REPLACE PROCEDURE actualizar_telefono (
    p_dui_cliente IN VARCHAR2,
    p_nuevo_telefono IN VARCHAR2
) AS
BEGIN
    UPDATE CLIENTES
    SET telefono = p_nuevo_telefono
    WHERE dui = p_dui_cliente;
END;
/