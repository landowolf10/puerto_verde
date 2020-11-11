<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $query = "CALL spInsertarAdminSalida();";
    
    echo $query;

    $stmt = $DBcon->prepare($query);
    $stmt->execute();

    foreach($body as $data)
    {
        $query2 = "CALL spInsertarSalida('". $data['nombre_producto']. "', '". $data['nombre_usuario']. "',
        '". $data['cantidad']. "', '". $data['precio_venta']. "', '". $data['sucursal']. "', '". $data['solicitante']. "',
        '". $data['autoriza']. "', '". $data['folio']. "');";
        
        echo $query2;
            
        $stmt2 = $DBcon->prepare($query2);
        $stmt2->execute();
    }
?>