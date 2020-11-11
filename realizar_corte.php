<?php
    require_once 'db_config.php';
    
    $query = "CALL spRealizarCorte();";
    
    echo $query;
         
    $stmt = $DBcon->prepare($query);
    $stmt->execute();
?>