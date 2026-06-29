CREATE TABLE productos (
    producto_id INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(200),
    categoria VARCHAR(50)
);

CREATE TABLE tiendas (
    tienda_id INTEGER PRIMARY KEY,
    ciudad VARCHAR(50),
    fecha_implementacion DATE
);

CREATE TABLE ventas (
    fecha DATE,
    tienda_id INTEGER,
    facturas INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    valor INTEGER,

    FOREIGN KEY (tienda_id) REFERENCES tiendas(tienda_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);