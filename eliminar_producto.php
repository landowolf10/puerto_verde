<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $id = $body['id'];

    $query = "CALL spEliminarProducto('". $id. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>