<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $nombre_producto = $body['nombre_producto'];
    $cantidad = $body['cantidad'];

    $query = "CALL spInsertarAlmacen('". $nombre_producto. "', '". $cantidad. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>