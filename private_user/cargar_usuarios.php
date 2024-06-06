<?php
// Include the database connection file
require_once("include/connection.php");

// Verificar si se ha enviado el fileId a través de GET
if(isset($_GET['fileId'])) {
    // Obtener el fileId de la solicitud GET
    $fileId = mysqli_real_escape_string($conn, $_GET['fileId']);

    // Consulta para cargar usuarios disponibles para compartir el archivo
    $query = "SELECT id, name, email_address FROM login_user WHERE user_status = 'Profesor'"; // Ejemplo de consulta, ajusta según tu estructura de base de datos y lógica de negocio
    
    $result = mysqli_query($conn, $query);

    // Comprobar si se obtuvieron resultados
    if(mysqli_num_rows($result) > 0) {
        // Iterar a través de los resultados y mostrar la lista de usuarios
        while($row = mysqli_fetch_assoc($result)) {
            // Aquí puedes imprimir los datos de cada usuario, por ejemplo:
            echo "<div>{$row['name']} - {$row['email_address']}</div>";
        }
    } else {
        // Mensaje si no se encontraron usuarios disponibles
        echo "<div>No se encontraron usuarios disponibles para compartir el archivo.</div>";
    }

    // Liberar el resultado de la consulta
    mysqli_free_result($result);
} else {
    // Mensaje si no se proporcionó el fileId
    echo "No se proporcionó el ID del archivo.";
}

// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>
