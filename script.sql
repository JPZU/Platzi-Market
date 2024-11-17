-- Se crea una base de datos llamada "estaciones_SIATA" si no existe.
DROP DATABASE IF EXISTS platzi_market;
CREATE DATABASE IF not EXISTS platzi_market;

-- Seleccionar base de datos
USE platzi_market; 

-- Vaciar las tablas
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS compras;
DROP TABLE IF EXISTS compras_productos;

CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY,
    descripcion VARCHAR(45),
    estado TINYINT
);

CREATE TABLE productos(
	id_producto INT PRIMARY KEY,
    nombre VARCHAR(45),
    id_categoria INT,
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16,2),
    cantidad_stock INT,
    estado TINYINT,
	CONSTRAINT fk_categoria_id_categoria FOREIGN KEY (id_categoria) 
    REFERENCES categorias(id_categoria) 
    ON UPDATE CASCADE 
    ON DELETE RESTRICT
);

CREATE TABLE clientes(
	id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40),
    apellidos VARCHAR(100),
    celular VARCHAR(150),
	direccion DECIMAL,
    correo_electronico VARCHAR(70)
);

CREATE TABLE compras(
	id_compra INT PRIMARY KEY,
    id_cliente VARCHAR(20),
    fecha DATETIME,
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR(1),
	CONSTRAINT fk_clientes_id_cliente FOREIGN KEY (id_cliente) 
    REFERENCES clientes(id) 
    ON UPDATE CASCADE 
    ON DELETE RESTRICT
);

CREATE TABLE compras_productos(
	id_compra INT PRIMARY KEY,
    id_producto INT,
	cantidad INT, 
    total DECIMAL(16,2),
    estado TINYINT,
	CONSTRAINT fk_compras_id_compra FOREIGN KEY (id_compra) 
    REFERENCES compras(id_compra) 
    ON UPDATE CASCADE 
    ON DELETE RESTRICT,
	CONSTRAINT fk_productos_id_producto FOREIGN KEY (id_producto) 
    REFERENCES productos(id_producto) 
    ON UPDATE CASCADE 
    ON DELETE RESTRICT
);


