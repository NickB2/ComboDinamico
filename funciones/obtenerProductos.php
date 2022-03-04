<?php

require_once __DIR__ . '/../php/conexion.php';

try {
    if (empty($_POST['id_subcategoria'])) {
        throw new Exception("No se enviaron datos suficientes", 400);
    }
    $id_subcategoria = (int) trim($_POST['id_subcategoria']);

    $query =   "SELECT P.id, P.desc, precio, M.desc AS 'marca'
                FROM productos AS P
                JOIN marcas AS M ON P.id_marca = M.id
                WHERE P.id_subcategoria = $id_subcategoria
                ORDER BY M.desc ASC, P.desc ASC";

    if (!$resultado = $conn->query($query)) {
        throw new Exception("Hubo un error al obtener los productos. $conn->error", 500);
    }

    $productos = array();

    while ($datos = $resultado->fetch_assoc()) {
        $productos[] = array(
            'id'=>$datos['id'],
            'descripcion'=>$datos['desc'],
            'precio'=>$datos['precio'],
            'marca'=>$datos['marca']
        );
    }

    http_response_code(200);
    echo json_encode(
        array(
            'message' => null,
            'code' => 200,
            'data' => $productos
        )
    );
} catch (Exception $e) {
    // Se establece el codigo de respuesta http
    http_response_code($e->getCode());

    // Se imprime un JSON con el mensaje de error
    echo json_encode(
        array(
            'message' => $e->getMessage(),
            'code' => $e->getCode(),
            'data' => null
        )
    );
}

$conn->close();
