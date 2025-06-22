
--EXEPTION ejemplos de una 
BEGIN
    -- Primera operación
    INSERT INTO clientes VALUES (...);

    -- Segunda operación dependiente
    INSERT INTO RESERVAS VALUES (...);
    
    --TERCERA OPERACION DEPENDIENTE 
    INSERT INTO HABITACIONES VALUES (...); 
    
    --CUARTA FINAL OPERACION DEPENDIENTE 
    INSERT INTO PAGOS VALUES (...); 
    
    COMMIT; -- Si todo salió bien

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Si algo falla, deshacer todo
        RAISE_APPLICATION_ERROR(-20005, 'Error en la transacción: ' || SQLERRM);
END;
