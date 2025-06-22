// genear un listado de las habitaciones que estan reservadas y el nombre del cliente que la ha reservado


//abitaciones -- num_habitacion
//cliente --nombre -- dui 

SELECT 
    h.num_habitacion,
    h.tipo,
    c.nombre AS nombre_cliente,
    r.fecha_entrada,
    r.fecha_salida
FROM 
    RESERVAS r
JOIN 
    CLIENTES c ON r.dui_cliente = c.dui
JOIN 
    HABITACIONES h ON r.num_habitacion = h.num_habitacion;