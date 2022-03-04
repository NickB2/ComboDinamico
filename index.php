<?php

require_once __DIR__.'/funciones/obtenerCategorias.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Ejemplo</title>
</head>

<body>
    <!-- As a heading -->
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">Ejemplo</span>
        </div>
    </nav>

    <div class="container">
        <!-- Seleccion de marca y modelos -->
        <form id="formulario" class="row g-3 mt-4">
            <div class="col-5">
                <label for="categoria" class="form-label">Categorias: </label>
                <select name="categoria" id="categoria" class="form-select" onchange="obtenerSubcategorias(this.value)" required>
                    <option value="" >----------</option>
                    <?php foreach ($categorias as $categoria) { ?>
                        <option value="<?= $categoria['id'] ?>"><?= $categoria['descripcion'] ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="col-5">
                <label for="subcategoria" class="form-label">Subcategorias: </label>
                <select name="subcategoria" id="subcategoria" class="form-select" disabled required>
                    <option value="">-----------</option>
                </select>
            </div>
            <div class="col-2">
                <label class="form-label">&nbsp;</label>
                <button class="btn btn-primary form-control" type="submit" >Enviar</button>
            </div>
        </form>

        <!-- Tabla de productos -->
        <div class="row mt-3">
            <div class="col">
                <table class="table table-hover" id="tablaProductos">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Precio (en ARS)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" class="text-center">No hay datos aún</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/funciones.js"></script>
</body>

</html>
