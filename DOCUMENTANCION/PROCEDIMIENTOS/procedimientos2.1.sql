-- PROCEDIMIENTO 3: Buscar pagos por cliente usando cursor
CREATE OR REPLACE PROCEDURE buscar_pagos_cliente (p_dui_cliente IN VARCHAR2) IS
    CURSOR c_pagos IS
        SELECT p.id_pago, p.monto, p.tipo_pago
        FROM PAGOS p
        JOIN RESERVAS r ON p.num_reserva = r.num_reserva
        WHERE r.dui_cliente = p_dui_cliente;
    v_pago_id PAGOS.id_pago%TYPE;
    v_monto PAGOS.monto%TYPE;
    v_tipo PAGOS.tipo_pago%TYPE;
BEGIN
    OPEN c_pagos;
    LOOP
        FETCH c_pagos INTO v_pago_id, v_monto, v_tipo;
        EXIT WHEN c_pagos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_pago_id || ', Monto: ' || v_monto || ', Tipo: ' || v_tipo);
    END LOOP;
    CLOSE c_pagos;
END;


-- PROCEDIMIENTO 4: Actualizar precios por tipo de habitación
CREATE OR REPLACE PROCEDURE actualizar_precio_habitacion (
    p_tipo IN VARCHAR2,
    p_incremento IN NUMBER
) AS
BEGIN
    UPDATE HABITACIONES
    SET precio = precio + p_incremento
    WHERE tipo = p_tipo;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'No se encontraron habitaciones de ese tipo.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20007, 'Error al actualizar precios: ' || SQLERRM);
END;


-- PROCEDIMIENTO 5: Eliminar reservas anteriores a una fecha
CREATE OR REPLACE PROCEDURE eliminar_reservas_antiguas (
    p_fecha_limite IN DATE
) AS
BEGIN
    DELETE FROM RESERVAS
    WHERE fecha_entrada < p_fecha_limite;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20008, 'No se encontraron reservas para eliminar.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20009, 'Error al eliminar reservas: ' || SQLERRM);
END;

