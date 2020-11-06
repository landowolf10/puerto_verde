<?php
    require_once 'db_config.php';
    header('Content-Type: application/json');

    $body = json_decode(file_get_contents("php://input"), true);

    $query = "CALL spInsertarAdminEntrada();";
    
    echo $query;

    $stmt = $DBcon->prepare($query);
    $stmt->execute();

    foreach($body as $data)
    {
        $query2 = "CALL spInsertarEntrada('". $data['nombre_producto']. "', '". $data['nombre_proveedor']. "',
        '". $data['nombre_usuario']. "', '". $data['precio_unitario']. "', '". $data['cantidad']. "');";
        
        echo $query2;
            
        $stmt2 = $DBcon->prepare($query2);
        $stmt2->execute();
    }
?>