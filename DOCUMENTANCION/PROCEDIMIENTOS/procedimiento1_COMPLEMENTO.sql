--usando el procedimiento de registrar pero antes ingreso los datos correspondientes en clientes y habitaciones 

INSERT INTO CLIENTES VALUES ('9999999-0', 'Ejemplo Prueba', '7000-0000'); 

INSERT INTO HABITACIONES VALUES (16, 'Individual', 60);

BEGIN
  registrar_reserva(
    20,
    TO_DATE('2025-06-15', 'YYYY-MM-DD'),
    TO_DATE('2025-06-10', 'YYYY-MM-DD'),
    '9999999-0',
    11
  );
END;

