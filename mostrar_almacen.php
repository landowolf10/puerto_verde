<?php
    require_once 'db_config.php';
     
     $query = "CALL spMostrarAlmacen();";
     
     $stmt = $DBcon->prepare($query);
     $stmt->execute();
     
     $proveedores = array();
     
     while($row=$stmt->fetch(PDO::FETCH_ASSOC))
     {
        $proveedores[] = $row;
     }
     
     echo json_encode($proveedores);