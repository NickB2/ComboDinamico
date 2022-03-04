<?php 

$conn = new mysqli('localhost','root','','ejemplo_1');

if($conn->connect_errno){
    echo "Error al conectar a la base de datos. Error: $conn->connect_error";
}

?>