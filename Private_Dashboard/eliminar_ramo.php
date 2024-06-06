<?php
// eliminar_ramo.php
session_start(); // Asegúrate de iniciar la sesión
require_once("include/connection.php");

$ur_id = $_GET['ur_id'] ?? '';

if ($ur_id) {
    // Eliminar el ramo usando el ID de la tabla usuarios_ramos
    $query = "DELETE FROM usuarios_ramos WHERE id = '$ur_id'";
    if(mysqli_query($conn, $query)) {
        // Redireccionar con mensaje de éxito
        echo "<script>alert('Ramo exitosamente eliminado'); window.location.href = 'view_user.php';</script>";
        
    } else {
        // Manejar el error
        echo "<script>alert('Error al eliminar el ramo'); window.location.href = 'view_user.php';</script>";
    }
} else {
    // Redirigir si la ID de ur_id no está presente
    echo "<script>alert('Identificador no válido'); window.location.href = 'view_user.php';</script>";
}
?>

