<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $tipo = $body['tipo'];
    $nombre = $body['nombre'];
    $descripcion = $body['descripcion'];
    $precio = $body['precio'];

    $query = "CALL spInsertarGasto('". $tipo. "', '". $nombre. "', '". $descripcion. "', '". $precio. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>