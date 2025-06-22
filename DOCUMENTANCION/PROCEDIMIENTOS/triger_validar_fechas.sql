--- TRIGGER 1: Validar fechas de reserva
CREATE OR REPLACE TRIGGER trg_validar_fechas
BEFORE INSERT OR UPDATE ON RESERVAS --antes de insertar o actualizar una reserva 
FOR EACH ROW --bucle que permite realizar acciiones en un conjunto de filas que cumplen una coondicion
BEGIN --cuerpo logico 
    IF :NEW.fecha_entrada >= :NEW.fecha_salida THEN --si fecha de entrada es mayor o igual a salida entonces::
        RAISE_APPLICATION_ERROR(-20001, 'La fecha de entrada debe ser menor que la de salida.'); --raise nos sirve para lanzar errores personalizados, se mostrara un error 
    END IF;
END; --fin del disparador 
/

