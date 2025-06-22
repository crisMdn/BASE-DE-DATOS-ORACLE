-- PROCEDIMIENTO 1: Registrar nueva reserva
CREATE OR REPLACE PROCEDURE registrar_reserva (
    p_num_reserva IN NUMBER,
    p_fecha_salida IN DATE,
    p_fecha_entrada IN DATE,
    p_dui_cliente IN VARCHAR2,
    p_num_habitacion IN NUMBER
) AS
BEGIN
    INSERT INTO RESERVAS VALUES (
        p_num_reserva,
        p_fecha_salida,
        p_fecha_entrada,
        p_dui_cliente,
        p_num_habitacion
    );
END;
/


--DATOS PARA HABITACIONES 
INSERT INTO HABITACIONES VALUES (14, 'Doble', 80);