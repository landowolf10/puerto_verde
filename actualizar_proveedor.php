<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $id = $body['id'];
    $nombre = $body['nombre'];
    $direccion = $body['direccion'];
    $telefono = $body['telefono'];
    $email = $body['email'];

    $query = "CALL spActualizarProveedor('". $id. "', '". $nombre. "', '". $direccion. "', '". $telefono. "', '". $email. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>