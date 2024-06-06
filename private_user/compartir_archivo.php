<?php
// compartir_archivo.php
require_once("include/connection.php");

if (isset($_POST['file_id']) && isset($_POST['hash']) && isset($_POST['users'])) {
    $fileId = mysqli_real_escape_string($conn, $_POST['file_id']);
    $hash = mysqli_real_escape_string($conn, $_POST['hash']);
    $users = $_POST['users'];

    // Verifica si el hash ya existe para evitar duplicados
    $checkQuery = "SELECT * FROM archivos_compartidos WHERE hash = '$hash'";
    $checkResult = mysqli_query($conn, $checkQuery);

    if(mysqli_num_rows($checkResult) > 0) {
        // El hash ya existe, maneja este caso como prefieras
        echo "<script>alert('El archivo ya ha sido compartido previamente.'); window.location.href='home.php';</script>";
    } else {
        // El hash no existe, procede a insertar
        // Inserta la información de cada usuario compartido en la tabla archivos_compartidos
        foreach ($users as $email) {
            $insertQuery = "INSERT INTO archivos_compartidos (hash, file_id, usuario_compartido) VALUES ('$hash', '$fileId', '$email')";

            if (!mysqli_query($conn, $insertQuery)) {
                // Error al insertar
                echo "<script>alert('Error al compartir el archivo. " . mysqli_error($conn) . "'); window.history.back();</script>";
                exit();
            }
        }

        // La inserción fue exitosa
        echo "<script>alert('Archivo compartido con éxito.'); window.location.href='home.php';</script>";
    }
} else {
    // Error: faltan parámetros
    echo "<script>alert('Error al compartir el archivo: faltan parámetros.'); window.history.back();</script>";
}
?>
