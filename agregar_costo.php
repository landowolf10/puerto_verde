<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $concepto = $body['concepto'];
    $descripcion = $body['descripcion'];
    $precio = $body['precio'];

    $query = "CALL spInsertarCosto('". $concepto. "', '". $descripcion. "', '". $precio. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>