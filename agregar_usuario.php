<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $nombre_usuario = $body['nombre_usuario'];
    $nombre = $body['nombre'];
    $apellido_paterno = $body['apellido_paterno'];
    $apellido_materno = $body['apellido_materno'];
    $telefono = $body['telefono'];
    $estado = $body['estado'];
    $ciudad = $body['ciudad'];
    $colonia = $body['colonia'];
    $calle = $body['calle'];
    $numero = $body['numero'];
    $pass = $body['pass'];

    $query = "CALL spInsertarUsuario('". $nombre_usuario. "', '". $nombre. "', '". $apellido_paterno. "', '". $apellido_materno. "',
    '". $telefono. "', '". $estado. "', '". $ciudad. "', '". $colonia. "', '". $calle. "', '". $numero. "', '". $pass. "');";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>