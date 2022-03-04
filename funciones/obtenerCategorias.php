<?php 

require_once __DIR__.'/../php/conexion.php';

$query = "SELECT * FROM categorias AS C ORDER BY C.desc ASC";

if(!$resultado = $conn->query($query)){
    echo "Hubo un error con la base de datos. Error: $conn->error";
}

$categorias = array();

while($datos = $resultado->fetch_assoc()){
    $categorias[] = array(
        'id'=>$datos['id'],
        'descripcion'=>$datos['desc']
    );
}

$conn->close();

?>