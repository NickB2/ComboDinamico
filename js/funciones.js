/**
 * Esta funcion toma el id de la categoria seleccionada, obtiene desde la base de datos las subcategorias relacionadas y actualiza los datos en el combo de subcategorias
 * @param {int} categoria Id de la categoria seleccionada
 */

function obtenerSubcategorias(categoria) {
    // Se obtiene el combo de subcategorias para poder manipularlo
    let selectSubcategoria = document.getElementById('subcategoria')

    // Se crea el objeto de peticion
    let peticion = new XMLHttpRequest

    //  Definimos un objeto FormData y le agregamos la categoria seleccionada
    let datos = new FormData()
    datos.append('id_categoria', categoria)

    // Definimos el metodo y la url a donde se enviaran los datos, y definimos que la peticion sera asincrona utilizando true como tercer parametro
    peticion.open('POST', 'funciones/obtenerSubcategorias.php', true)

    // Definimos que la respuesta sera de formato json
    peticion.responseType = "json"

    // Definimos las acciones que se realizaran cuando se ejecuta el evento de cambio de estado de la peticion
    peticion.onreadystatechange = function (evento) {

        // Si la transaccion termino el readyState sera 4
        if (peticion.readyState == 4) {

            // Se vacia el combo y se agrega uno sin valor y texto para dar pie a seleccionar el resto de opciones nuevas
            selectSubcategoria.innerHTML = null

            let optionVacio = new Option('-----------', '', false, true)
            optionVacio.disabled = true

            selectSubcategoria.append(optionVacio)

            // Si se ejecuto exitosamente
            if (peticion.status == 200) {

                let datos = peticion.response.data

                // Recorremos los datos obtenidos y 
                for (i = 0; i < datos.length; i++) {
                    selectSubcategoria.append(new Option(datos[i].descripcion, datos[i].id, false, false))
                }

                // Se habilita el combo para seleccionar las subcategorias
                selectSubcategoria.disabled = false

            } else {
                //  Se deshabilita el combo
                selectSubcategoria.disabled = true

                // Mostramos el codigo http y el mensaje devuelto por el servidor
                alert('Error ' + peticion.status + ' : \n' + peticion.response.message)
            }
        }
    }

    peticion.send(datos)
}


function obtenerProductos(subcategoria) {

    let peticion = new XMLHttpRequest

    let datos = new FormData()
    datos.append('id_subcategoria', subcategoria)

    peticion.open('POST', 'funciones/obtenerProductos.php', true)
    peticion.responseType = "json"
    peticion.onreadystatechange = function (evento) {
        if (peticion.readyState == 4) {

            // Obtenemos el tbody de la tabla a manipular y vaciamos su contenido para poblarlo con los datos recibidos del servidor
            let tablaProductos = document.querySelector('#tablaProductos tbody')
            tablaProductos.innerHTML = null

            if (peticion.status == 200) {

                let datos = peticion.response.data

                if (datos.length > 0) {
                    for (i = 0; i < datos.length; i++) {
                        // Creamos una nueva fila para el contenido de la tabla
                        let row = document.createElement('tr')

                        // Creamos los elementos td para cada una de las columnas

                        let id = document.createElement('td')
                        id.appendChild(document.createTextNode(datos[i].id))

                        let marca = document.createElement('td')
                        marca.appendChild(document.createTextNode(datos[i].marca))

                        let modelo = document.createElement('td')
                        modelo.appendChild(document.createTextNode(datos[i].descripcion))

                        let precio = document.createElement('td')
                        precio.appendChild(document.createTextNode("$" + datos[i].precio))

                        // Agregamos cada td al elemento tr (fila nueva de la tabla)
                        row.appendChild(id)
                        row.appendChild(marca)
                        row.appendChild(modelo)
                        row.appendChild(precio)

                        // Y se agrega la fila a la tabla
                        tablaProductos.appendChild(row)
                    }
                } else {
                    // En caso de que la subcategoria no tenga productos registrados, se crea una fila con un solo td con un colspan de 4 para abarcar toda la fila
                    let row = document.createElement('tr')
                    let col = document.createElement('td')
                    col.colSpan = 4
                    col.className = 'text-center'
                    col.appendChild(document.createTextNode('No se encontraron productos'))
                    row.appendChild(col)
                    tablaProductos.appendChild(row)
                }

            } else {
                alert('Error ' + peticion.status + ' : \n' + peticion.response.message)
            }
        }
    }

    peticion.send(datos)
}

// Obtenemos el formulario de donde obtendremos el valor de la subcategoria para cargar los productos
let formularioCategorias = document.getElementById('formulario')

// Agregamos un event listener al formulario
formularioCategorias.addEventListener('submit', function (e) {
    // Evitamos el submit nativo del formulario para poder ejecutar nuestra propia funcion
    e.preventDefault()

    // Ejecutamos la funcion obtenerProductos y le pasamos como parametro el valor seleccionado del combo de subcategorias
    obtenerProductos(document.getElementById('subcategoria').value)

})