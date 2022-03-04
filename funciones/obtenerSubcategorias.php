<?php

require_once __DIR__ . '/../php/conexion.php';

try {
    if (empty($_POST['id_categoria'])) {
        throw new Exception("No se enviaron datos suficientes", 400);
    }
    $id_categoria = (int) trim($_POST['id_categoria']);

    $query = "SELECT * FROM subcategorias AS S WHERE S.id_categoria = $id_categoria ORDER BY S.desc ASC";

    if (!$resultado = $conn->query($query)) {
        throw new Exception("Hubo un error al obtener las subcategorias", 500);
    }

    $subcategorias = array();

    while ($datos = $resultado->fetch_assoc()) {
        $subcategorias[] = array(
            'id' => $datos['id'],
            'descripcion' => $datos['desc']
        );
    }

    http_response_code(200);
    echo json_encode(
        array(
            'message'=> null,
            'code' => 200,
            'data' => $subcategorias
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
