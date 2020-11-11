CREATE TABLE IF NOT EXISTS proveedores
(
    id 					INT AUTO_INCREMENT,
    nombre 			 	VARCHAR(30)  NOT NULL,
    direccion 	        VARCHAR(300) NOT NULL,
    telefono 			VARCHAR(10)  NOT NULL,
    email               VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE productos;

CREATE TABLE IF NOT EXISTS productos
(
    id 					INT AUTO_INCREMENT,
    nombre 			 	VARCHAR(50)  NOT NULL,
    descripcion 	    VARCHAR(300) NOT NULL,
    categoria 			VARCHAR(50)  NOT NULL,
    precio_venta        DECIMAL(10, 2)  NOT NULL,
    unidad				VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS usuarios
(
    id 					INT AUTO_INCREMENT,
    nombre_usuario		VARCHAR(50),
    nombre 			 	VARCHAR(30) NOT NULL,
    apellido_paterno 	VARCHAR(30) NOT NULL,
    apellido_materno 	VARCHAR(30) NOT NULL,
    telefono 			VARCHAR(10),
    estado				VARCHAR(30),
    ciudad				VARCHAR(30),
    colonia				VARCHAR(30),
    calle				VARCHAR(30),
    numero				VARCHAR(30),
    pass				VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS almacen
(
    id 					INT AUTO_INCREMENT,
    id_producto 		INT NOT NULL,
    cantidad 	    	INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS sucursales
(
    id 					INT AUTO_INCREMENT,
    nombre 				VARCHAR(100) NOT NULL,
    direccion 	    	VARCHAR(300) NOT NULL,
    telefono 	    	VARCHAR(10) NOT NULL,
    responsable 	    VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS periodo
(
    id 					INT AUTO_INCREMENT,
    fecha 				DATE,
    hora 	    		TIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS costos
(
    id 					INT AUTO_INCREMENT,
    id_periodo 			INT NOT NULL,
    concepto 	    	VARCHAR(100) NOT NULL,
    descripcion 	    VARCHAR(300) NOT NULL,
    precio 	    		DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS gastos
(
    id 					INT AUTO_INCREMENT,
    id_periodo 			INT NOT NULL,
    tipo 	    		VARCHAR(100) NOT NULL,
    nombre 	    		VARCHAR(100) NOT NULL,
    descripcion 	    VARCHAR(300) NOT NULL,
    precio 	    		DECIMAL(10, 2) NOT NULL,
    fecha 				DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS entradas
(
    id 					INT AUTO_INCREMENT,
    id_admin_entradas	INT NOT NULL,
    id_producto 		INT NOT NULL,
    id_proveedor 		INT NOT NULL,
    id_usuario			INT NOT NULL,
    precio_unitario 	DECIMAL(10, 3) NOT NULL,
    cantidad			INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS admin_entradas
(
    id		INT AUTO_INCREMENT,
    fecha	DATE NOT NULL,
    hora 	TIME NOT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE IF NOT EXISTS salidas
(
    id 					INT AUTO_INCREMENT,
    id_admin_salidas	INT NOT NULL,
    id_producto 		INT NOT NULL,
    id_usuario			INT NOT NULL,
    cantidad			INT NOT NULL,
    precio_venta 		DECIMAL(10, 3) NOT NULL,
    sucursal			VARCHAR(100) NOT NULL,
    nombre_solicitante	VARCHAR(200) NOT NULL,
    nombre_autoriza		VARCHAR(200) NOT NULL,
    folio_cotizacion	VARCHAR(200) NOT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE IF NOT EXISTS admin_salidas
(
    id		INT AUTO_INCREMENT,
    fecha	DATE NOT NULL,
    hora 	TIME NOT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE IF NOT EXISTS cortes
(
    id				INT AUTO_INCREMENT,
    id_periodo		INT NOT NULL,
    total_costos	DECIMAL(10, 2) NOT NULL,
    total_gastos	DECIMAL(10, 2) NOT NULL,
    total_entradas	DECIMAL(10, 2) NOT NULL,
    total_salidas	DECIMAL(10, 2) NOT NULL,
    fecha			DATE NOT NULL,
    hora 			TIME NOT NULL,
    total			DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);




DELIMITER //
CREATE PROCEDURE spInsertarProveedor
(
    IN _nombre 		VARCHAR(30), 
    IN _direccion 	VARCHAR(300),  
    IN _telefono 	VARCHAR(10),
    IN _email 		VARCHAR(50)
)
BEGIN
	INSERT INTO proveedores (nombre, direccion, telefono, email)  VALUES
	(_nombre, _direccion, _telefono, _email);
END//
DELIMITER ;

CALL spInsertarProveedor('Proveedor 2', 'Ixtapa', '54321', 'sadasd@algo.com');

SELECT *
FROM proveedores;

DELIMITER //
CREATE PROCEDURE spMostrarProveedores
()
BEGIN
	SELECT *
    FROM proveedores;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spActualizarProveedor
(
    IN _id			INT,
    IN _nombre 		VARCHAR(30), 
    IN _direccion 	VARCHAR(300),  
    IN _telefono 	VARCHAR(10),
    IN _email 		VARCHAR(50)
)
BEGIN
	IF _nombre IS NOT NULL THEN
    	UPDATE proveedores 
        SET nombre = _nombre
        WHERE id = _id;
    END IF;
    
	IF _direccion IS NOT NULL THEN
    	UPDATE proveedores 
        SET direccion = _direccion
        WHERE id = _id;
    END IF;

	IF _telefono IS NOT NULL THEN
    	UPDATE proveedores 
        SET telefono = _telefono
        WHERE id = _id;
    END IF;
    
	IF _email IS NOT NULL THEN
    	UPDATE proveedores 
        SET email = _email
        WHERE id = _id;
    END IF;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spEliminarProveedor
(
	IN _id INT
)
BEGIN
	DELETE FROM proveedores WHERE id = _id;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarProducto
(
    IN _nombre 		 VARCHAR(50), 
    IN _descripcion  VARCHAR(300),  
    IN _categoria 	 VARCHAR(50),
    IN _precio_venta DECIMAL(10, 2),
    IN _unidad		 VARCHAR(30)
)
BEGIN
	INSERT INTO productos (nombre, descripcion, categoria, precio_venta, unidad)  VALUES
	(_nombre, _descripcion, _categoria, _precio_venta, _unidad);
END//
DELIMITER ;

CALL spInsertarProducto('Producto 2', 'Descripción del producto 2', 'Prueba', '10', 'Prueba');

SELECT *
FROM productos;

DELIMITER //
CREATE PROCEDURE spMostrarProductos
()
BEGIN
	SELECT *
    FROM productos;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spActualizarProducto
(
    IN _id			 INT,
    IN _nombre 		 VARCHAR(50), 
    IN _descripcion  VARCHAR(300),  
    IN _categoria 	 VARCHAR(50),
    IN _precio_venta DECIMAL(10, 2),
    IN _unidad 		 VARCHAR(30)
)
BEGIN
	IF _nombre IS NOT NULL THEN
    	UPDATE productos 
        SET nombre = _nombre
        WHERE id = _id;
    END IF;
    
	IF _descripcion IS NOT NULL THEN
    	UPDATE productos 
        SET descripcion = _descripcion
        WHERE id = _id;
    END IF;

	IF _categoria IS NOT NULL THEN
    	UPDATE productos 
        SET categoria = _categoria
        WHERE id = _id;
    END IF;
    
	IF _precio_venta IS NOT NULL THEN
    	UPDATE productos 
        SET precio_venta = _precio_venta
        WHERE id = _id;
    END IF;
    
	IF _unidad IS NOT NULL THEN
    	UPDATE productos 
        SET unidad = _unidad
        WHERE id = _id;
    END IF;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spEliminarProducto
(
	IN _id INT
)
BEGIN
	DECLARE cantidad_producto INT;
    
    SELECT a.cantidad
    INTO cantidad_producto
    FROM almacen AS a
    WHERE a.id_producto = _id;

	DELETE FROM productos WHERE id = _id;
    
    IF cantidad_producto = 0 THEN
		DELETE FROM almacen WHERE id_producto = _id;
	END IF;
END//
DELIMITER ;

DROP PROCEDURE spEliminarProducto

DELIMITER //
CREATE PROCEDURE spInsertarUsuario
(
    IN _nombre_usuario	VARCHAR(50), 
    IN _nombre  		VARCHAR(30),  
    IN _ap 	 			VARCHAR(30),
    IN _am 				VARCHAR(30),
    IN _telefono		VARCHAR(10),
    IN _estado			VARCHAR(30),
    IN _ciudad			VARCHAR(30),
    IN _colonia			VARCHAR(30),
    IN _calle			VARCHAR(30),
    IN _numero			VARCHAR(30),
    in _pass			VARCHAR(20)
)
BEGIN
	INSERT INTO usuarios (nombre_usuario, nombre, apellido_paterno, apellido_materno, telefono, estado, ciudad, colonia, calle, numero, pass)  VALUES
	(_nombre_usuario, _nombre, _ap, _am, _telefono, _estado, _ciudad, _colonia, _calle, _numero, _pass);
END//
DELIMITER ;

CALL spInsertarUsuario('LandoWolf', 'Luis Orlando', 'Avila', 'Garcia', '5564191682', 'Ciudad de México', 'CDMX', 'Las Cruces', 'Ahuatla', 'S/N', 'LandoWolf10*');

SELECT *
FROM usuarios;

DELIMITER //
CREATE PROCEDURE spMostrarUsuarios
()
BEGIN
	SELECT *
    FROM usuarios;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spActualizarUsuario
(
    IN _id			 	INT,
    IN _nombre_usuario	VARCHAR(50),
    IN _nombre 		 	VARCHAR(30), 
    IN _ap  			VARCHAR(30),
    IN _am  			VARCHAR(30),
    IN _telefono 	 	VARCHAR(10),
    IN _estado 			VARCHAR(30),
    IN _ciudad 		 	VARCHAR(30),
    IN _colonia		 	VARCHAR(30),
    IN _calle 		 	VARCHAR(30),
    IN _numero 		 	VARCHAR(30),
    IN _pass 		 	VARCHAR(20)
)
BEGIN
	IF _nombre_usuario IS NOT NULL THEN
    	UPDATE usuarios 
        SET nombre_usuario = _nombre_usuario
        WHERE id = _id;
    END IF;

	IF _nombre IS NOT NULL THEN
    	UPDATE usuarios 
        SET nombre = _nombre
        WHERE id = _id;
    END IF;
    
	IF _ap IS NOT NULL THEN
    	UPDATE usuarios 
        SET apellido_paterno = _ap
        WHERE id = _id;
    END IF;

	IF _am IS NOT NULL THEN
    	UPDATE usuarios 
        SET apellido_materno = _am
        WHERE id = _id;
    END IF;
    
	IF _telefono IS NOT NULL THEN
    	UPDATE usuarios 
        SET telefono = _telefono
        WHERE id = _id;
    END IF;
    
	IF _estado IS NOT NULL THEN
    	UPDATE usuarios 
        SET estado = _estado
        WHERE id = _id;
    END IF;
    
	IF _ciudad IS NOT NULL THEN
    	UPDATE usuarios 
        SET ciudad = _ciudad
        WHERE id = _id;
    END IF;
    
	IF _colonia IS NOT NULL THEN
    	UPDATE usuarios 
        SET colonia = _colonia
        WHERE id = _id;
    END IF;
    
	IF _calle IS NOT NULL THEN
    	UPDATE usuarios 
        SET calle = _calle
        WHERE id = _id;
    END IF;
    
	IF _numero IS NOT NULL THEN
    	UPDATE usuarios 
        SET numero = _numero
        WHERE id = _id;
    END IF;
    
	IF _pass IS NOT NULL THEN
    	UPDATE usuarios 
        SET pass = _pass
        WHERE id = _id;
    END IF;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spEliminarUsuario
(
	IN _id INT
)
BEGIN
	DELETE FROM usuarios WHERE id = _id;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarAlmacen
(
    IN nombre_producto 	VARCHAR(50), 
    IN _cantidad  		INT
)
BEGIN
	DECLARE id_p INT;
    DECLARE mensaje	VARCHAR(200);

	IF EXISTS
    (
		SELECT p.nombre
        FROM productos AS p
        WHERE p.nombre = nombre_producto
    ) THEN
		SELECT p.id
        INTO id_p
        FROM productos AS p
        WHERE p.nombre = nombre_producto;
    
		INSERT INTO almacen (id_producto, cantidad)  VALUES
		(id_p, _cantidad);
	ELSE
		SET mensaje = 'El producto seleccionado no existe';
        SELECT mensaje;
	END IF;
END//
DELIMITER ;

CALL spInsertarAlmacen('Producto 1', 5);



DELIMITER //
CREATE PROCEDURE spMostrarAlmacen
()
BEGIN
	SELECT p.id, p.nombre, a.cantidad
	FROM almacen AS a
	JOIN productos AS p ON a.id_producto = p.id
	GROUP BY a.id;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spActualizarAlmacen
(
    IN _id			 	INT,
    IN _cantidad		INT
)
BEGIN
	IF _cantidad IS NOT NULL THEN
    	UPDATE almacen 
        SET cantidad = _cantidad
        WHERE id_producto = _id;
    END IF;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarSucursal
(
    IN _nombre		VARCHAR(100), 
    IN _direccion  	VARCHAR(300),  
    IN _telefono 	VARCHAR(10),
    IN _responsable	VARCHAR(100)
)
BEGIN
	INSERT INTO sucursales (nombre, direccion, telefono, responsable)  VALUES
	(_nombre, _direccion, _telefono, _responsable);
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spMostrarSucursales
()
BEGIN
	SELECT *
    FROM sucursales;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spActualizarSucursal
(
    IN _id			 	INT,
    IN _nombre		VARCHAR(100), 
    IN _direccion  	VARCHAR(300),  
    IN _telefono 	VARCHAR(10),
    IN _responsable	VARCHAR(100)
)
BEGIN
	IF _nombre IS NOT NULL THEN
    	UPDATE sucursales 
        SET nombre = _nombre
        WHERE id = _id;
    END IF;

	IF _direccion IS NOT NULL THEN
    	UPDATE sucursales 
        SET direccion = _direccion
        WHERE id = _id;
    END IF;
    
	IF _telefono IS NOT NULL THEN
    	UPDATE sucursales 
        SET telefono = _telefono
        WHERE id = _id;
    END IF;

	IF _responsable IS NOT NULL THEN
    	UPDATE sucursales 
        SET responsable = _responsable
        WHERE id = _id;
    END IF;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spEliminarSucursal
(
	IN _id INT
)
BEGIN
	DELETE FROM sucursales WHERE id = _id;
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarAdminEntrada
()
BEGIN
	INSERT INTO admin_entradas (fecha, hora)
    VALUES (CURDATE(), CURTIME());
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarEntrada
(
   IN _nombre_producto 	VARCHAR(50),
   IN _nombre_proveedor VARCHAR(30),
   IN _nombre_usuario	VARCHAR(50),
   IN _precio_unitario 	DECIMAL(10, 3),
   IN _cantidad			INT
)
BEGIN
	DECLARE _id_admin_entradas INT;
    DECLARE _id_producto INT;
    DECLARE _id_proveedor INT;
    DECLARE _id_usuario INT;
    
    SELECT ae.id
    INTO _id_admin_entradas
    FROM admin_entradas AS ae
    ORDER BY ae.id DESC
    LIMIT 1;
    
    SELECT p.id
    INTO _id_producto
    FROM productos AS p
    WHERE p.nombre = _nombre_producto;
    
    SELECT pr.id
    INTO _id_proveedor
    FROM proveedores AS pr
    WHERE pr.nombre = _nombre_proveedor;
    
    SELECT u.id
    INTO _id_usuario
    FROM usuarios AS u
    WHERE u.nombre_usuario = _nombre_usuario;

	INSERT INTO entradas (id_admin_entradas, id_producto, id_proveedor, id_usuario, precio_unitario, cantidad)  VALUES
	(_id_admin_entradas, _id_producto, _id_proveedor, _id_usuario, _precio_unitario, _cantidad);
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarAdminSalida
()
BEGIN
	INSERT INTO admin_salidas (fecha, hora)
    VALUES (CURDATE(), CURTIME());
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarSalida
(
   IN _nombre_producto 	VARCHAR(50),
   IN _nombre_usuario	VARCHAR(50),
   IN _cantidad			INT,
   IN _precio_venta 	DECIMAL(10, 3),
   IN _sucursal			VARCHAR(100),
   IN _solicitante		VARCHAR(200),
   IN _autoriza			VARCHAR(200),
   IN _folio			VARCHAR(200)
)
BEGIN
	DECLARE _id_admin_salidas INT;
    DECLARE _id_producto INT;
    DECLARE _id_usuario INT;
    
    SELECT ads.id
    INTO _id_admin_salidas
    FROM admin_salidas AS ads
    ORDER BY ads.id DESC
    LIMIT 1;
    
    SELECT p.id
    INTO _id_producto
    FROM productos AS p
    WHERE p.nombre = _nombre_producto;
    
    SELECT u.id
    INTO _id_usuario
    FROM usuarios AS u
    WHERE u.nombre_usuario = _nombre_usuario;

	INSERT INTO salidas (id_admin_salidas, id_producto, id_usuario, cantidad, precio_venta, sucursal, nombre_solicitante, nombre_autoriza, folio_cotizacion)  VALUES
	(_id_admin_salidas, _id_producto, _id_usuario, _cantidad, _precio_venta, _sucursal, _solicitante, _autoriza, _folio);
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarCosto
(
   IN _concepto 	VARCHAR(100),
   IN _descripcion	VARCHAR(300),
   IN _precio		DECIMAL(10, 2)
)
BEGIN
	DECLARE periodoID INT;
    
    SELECT p.id
    INTO periodoID
    FROM periodo AS p
    ORDER BY p.fecha DESC, p.hora DESC
	LIMIT 1;

	INSERT INTO costos (id_periodo, concepto, descripcion, precio)  VALUES
	(periodoID, _concepto, _descripcion, _precio);
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spInsertarGasto
(
   IN _tipo 		VARCHAR(100),
   IN _nombre		VARCHAR(100),
   IN _descripcion	VARCHAR(300),
   IN _precio		DECIMAL(10, 2)
)
BEGIN
	DECLARE periodoID INT;
    
    SELECT p.id
    INTO periodoID
    FROM periodo AS p
    ORDER BY p.fecha DESC, p.hora DESC
	LIMIT 1;

	INSERT INTO gastos (id_periodo, tipo, nombre, descripcion, precio, fecha)  VALUES
	(periodoID, _tipo, _nombre, _descripcion, _precio, CURDATE());
END//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE spRealizarCorte
()
BEGIN
    DECLARE periodoID 		INT;
    DECLARE suma_costos		DECIMAL(10, 2);
    DECLARE suma_gastos		DECIMAL(10, 2);
    DECLARE suma_entradas	DECIMAL(10, 2);
    DECLARE suma_salidas	DECIMAL(10, 2);
    DECLARE totalVenta		DECIMAL(10, 2);
    
    SELECT p.id
    INTO periodoID
    FROM periodo AS p
    ORDER BY p.id DESC
	LIMIT 1;
    
    SELECT SUM(c.precio)
    INTO suma_costos
    FROM costos AS c
    WHERE c.id_periodo = periodoID;
    
    SELECT SUM(g.precio)
    INTO suma_gastos
    FROM gastos AS g
    WHERE g.id_periodo = periodoID;
    
    SELECT SUM(e.precio_unitario)
    INTO suma_entradas
    FROM entradas AS e
    WHERE e.id_admin_entradas = periodoID;
    
    SELECT SUM(s.precio_venta)
    INTO suma_salidas
    FROM salidas AS s
    WHERE s.id_admin_salidas = periodoID;
    
	SELECT SUM(s.precio_venta)
    INTO totalVenta
    FROM salidas AS s
    WHERE s.id_admin_salidas = periodoID;
    
    INSERT INTO cortes (id_periodo, total_costos, total_gastos, total_entradas, total_salidas, fecha, hora, total) VALUES
    (periodoID, suma_costos, suma_gastos, suma_entradas, suma_salidas, CURDATE(), CURTIME(), totalVenta);
    
    INSERT INTO periodo (fecha, hora) VALUES
    (CURDATE(), CURTIME());
END//
DELIMITER ;






SELECT *
FROM productos;

SELECT *
FROM almacen;

SELECT *
FROM sucursales;

SELECT *
FROM admin_salidas;

SELECT *
FROM salidas;

TRUNCATE TABLE admin_entradas;

INSERT INTO periodo (fecha, hora) VALUES (CURDATE(), CURTIME());

SELECT *
FROM periodo;

SELECT *
FROM costos;

SELECT *
FROM gastos;

SELECT *
FROM cortes;