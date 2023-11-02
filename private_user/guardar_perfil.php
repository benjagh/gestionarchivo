<?php
session_start();

if (!isset($_SESSION["email_address"])) {
    header("location:../login.html");
    exit; // Asegurarse de que el script se detenga después de redirigir
}

require_once("include/connection.php");

// Obtener el ID de usuario de la sesión
$id = mysqli_real_escape_string($conn, $_SESSION['email_address']);

// Recopilar los datos del formulario
$fechaNacimiento = mysqli_real_escape_string($conn, $_POST['fecha_nacimiento']);
$rut = mysqli_real_escape_string($conn, $_POST['rut']);
$carrera = mysqli_real_escape_string($conn, $_POST['carrera']);
$sede = mysqli_real_escape_string($conn, $_POST['sede']);
$ramos = mysqli_real_escape_string($conn, $_POST['ramos']);

// Procesar la imagen de perfil si se ha cargado
if ($_FILES['foto_perfil']['error'] == 0) {
    $fotoPerfilName = $_FILES['foto_perfil']['name'];
    $fotoPerfilTmpName = $_FILES['foto_perfil']['tmp_name'];
    $fotoPerfilSize = $_FILES['foto_perfil']['size'];

    // Directorio de destino para la imagen de perfil
    $uploadDir = "uploads/";

    // Nombre de archivo único para la imagen de perfil
    $fotoPerfilPath = $uploadDir . basename($fotoPerfilName);

    // Mover la imagen de perfil al directorio de destino
    if (move_uploaded_file($fotoPerfilTmpName, $fotoPerfilPath)) {
        // La imagen de perfil se ha cargado con éxito, puedes guardar la ruta en la base de datos
        // Aquí debes agregar código para actualizar la columna 'foto_de_perfil' en la base de datos
        // Por ejemplo:
        $sql = "UPDATE login_user SET fecha_de_nacimiento = '$fechaNacimiento', rut = '$rut', carrera = '$carrera', sede = '$sede', ramos = '$ramos', foto_de_perfil = '$fotoPerfilPath' WHERE email_address = '$id'";

        if (mysqli_query($conn, $sql)) {
            echo "Perfil actualizado exitosamente.";
        } else {
            echo "Error al actualizar el perfil: " . mysqli_error($conn);
        }
    } else {
        echo "Error al cargar la imagen de perfil.";
    }
} else {
    // No se cargó una nueva imagen de perfil, solo actualizar otros campos
    $sql = "UPDATE login_user SET fecha_de_nacimiento = '$fechaNacimiento', rut = '$rut', carrera = '$carrera', sede = '$sede', ramos = '$ramos' WHERE email_address = '$id'";

    if (mysqli_query($conn, $sql)) {
        echo "Perfil actualizado exitosamente.";
    } else {
        echo "Error al actualizar el perfil: " . mysqli_error($conn);
    }
}

mysqli_close($conn);
?>
