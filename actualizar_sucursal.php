<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $id = $body['id'];
    $nombre = $body['nombre'];
    $direccion = $body['direccion'];
    $telefono = $body['telefono'];
    $responsable = $body['responsable'];
    

    $query = "CALL spActualizarSucursal('". $id. "', '". $nombre. "', '". $direccion. "', '". $telefono. "', '". $responsable. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>