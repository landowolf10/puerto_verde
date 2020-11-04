<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $id = $body['id'];
    $nombre = $body['nombre'];
    $descripcion = $body['descripcion'];
    $categoria = $body['categoria'];
    $precio_venta = $body['precio_venta'];
    $unidad = $body['unidad'];

    $query = "CALL spActualizarProducto('". $id. "', '". $nombre. "', '". $descripcion. "', '". $categoria. "', '". $precio_venta. "',
    '". $unidad. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>