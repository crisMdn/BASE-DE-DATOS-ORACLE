-- Tabla CLIENTES
CREATE TABLE CLIENTES (
    dui VARCHAR2(10) PRIMARY KEY,
    nombre VARCHAR2(100),
    telefono VARCHAR2(15)
);

-- Tabla HABITACIONES
CREATE TABLE HABITACIONES (
    num_habitacion NUMBER PRIMARY KEY,
    tipo VARCHAR2(50),
    precio NUMBER(10,2)
);

-- Tabla RESERVAS
CREATE TABLE RESERVAS (
    num_reserva NUMBER PRIMARY KEY,
    fecha_salida DATE,
    fecha_entrada DATE,
    dui_cliente VARCHAR2(10),
    num_habitacion NUMBER,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (dui_cliente) 
    REFERENCES CLIENTES(dui),
    CONSTRAINT fk_reserva_habitacion FOREIGN KEY (num_habitacion) 
    REFERENCES HABITACIONES(num_habitacion)
);

-- Tabla PAGOS
CREATE TABLE PAGOS (
    id_pago NUMBER PRIMARY KEY,
    num_reserva NUMBER,
    fecha DATE,
    tipo_pago VARCHAR2(50),
    monto NUMBER(10,2),
    CONSTRAINT fk_pago_reserva FOREIGN KEY (num_reserva) 
    REFERENCES RESERVAS(num_reserva)
);


