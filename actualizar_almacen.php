<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $id = $body['id'];
    $cantidad = $body['cantidad'];
    

    $query = "CALL spActualizarAlmacen('". $id. "', '". $cantidad. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>