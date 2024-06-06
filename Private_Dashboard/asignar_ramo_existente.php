<?php
// Verificar si se reciben datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificar si se reciben los datos esperados
    if (isset($_POST['user_id']) && isset($_POST['ramo_id'])) {
        // Conectar a la base de datos
        require_once("include/connection.php");

        // Obtener los valores enviados por el formulario
        $user_id = $_POST['user_id'];
        $ramo_id = $_POST['ramo_id'];

        // Insertar los datos en la tabla usuarios_ramos
        $query = "INSERT INTO usuarios_ramos (user_id, ramo_id) VALUES ('$user_id', '$ramo_id')";
        $result = mysqli_query($conn, $query);

        if ($result) {
            // Éxito al asignar el ramo al usuario
            echo "<script>alert('Ramo exitosamente asignado'); window.location.href = 'view_user.php';</script>";
            exit(); // Asegura que el script se detenga después de la redirección
        } else {
            // Error al asignar el ramo al usuario
            echo "Error al asignar el ramo al usuario: " . mysqli_error($conn);
        }
    } else {
        // Datos faltantes del formulario
        echo "Faltan datos del formulario.";
    }
} else {
    // Acceso no autorizado
    echo "Acceso no autorizado.";
}
?>
