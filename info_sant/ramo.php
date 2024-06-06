<?php
require_once("include/connection.php");

// Agregar nuevo ramo
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['agregarRamo'])) {
    $ramo = mysqli_real_escape_string($conn, $_POST['nombreRamo']);
    $codigo_ramo = mysqli_real_escape_string($conn, $_POST['codigoRamo']);
    $periodo = mysqli_real_escape_string($conn, $_POST['periodoRamo']);
    $año = mysqli_real_escape_string($conn, $_POST['añoRamo']);
    $nivel = mysqli_real_escape_string($conn, $_POST['nivelRamo']);
    $sede = mysqli_real_escape_string($conn, $_POST['sedeRamo']);
    $carrera = mysqli_real_escape_string($conn, $_POST['carreraRamo']);

    $query = "INSERT INTO ramos (nombre_ramo, codigo_ramo, periodo, año, nivel, sede, carrera) 
              VALUES ('$ramo', '$codigo_ramo', '$periodo', '$año', '$nivel', '$sede', '$carrera')";

    if (mysqli_query($conn, $query)) {
        echo "<script type='text/javascript'>alert('Ramo agregado correctamente');document.location='dashboard.php'</script>";
    } else {
        echo "Error al agregar el ramo: " . mysqli_error($conn);
    }
}

// Eliminar un ramo
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['eliminarRamo'])) {
    $nombre_ramo_eliminar = $_POST['nombreRamoEditar'];

    // Deshabilitar temporalmente la restricción de clave externa
    mysqli_query($conn, "SET foreign_key_checks = 0");

    // Consulta preparada para evitar inyección SQL
    $query = "DELETE FROM ramos WHERE nombre_ramo = ?";
    
    // Preparar la consulta
    $stmt = mysqli_prepare($conn, $query);
    
    // Vincular parámetros
    mysqli_stmt_bind_param($stmt, "s", $nombre_ramo_eliminar);

    // Ejecutar la consulta
    if (mysqli_stmt_execute($stmt)) {
        // Verificar si se afectó algún registro
        if (mysqli_stmt_affected_rows($stmt) > 0) {
            echo "<script>alert('Ramo eliminado correctamente');window.location.href='dashboard.php';</script>";
        } else {
            echo "<script>alert('No se encontró el ramo a eliminar');window.location.href='dashboard.php';</script>";
        }
    } else {
        echo "Error al eliminar el ramo: " . mysqli_error($conn);
    }

    // Habilitar nuevamente la restricción de clave externa
    mysqli_query($conn, "SET foreign_key_checks = 1");

    // Cerrar la consulta preparada
    mysqli_stmt_close($stmt);
}

// Editar un ramo
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['guardarEdicion'])) {
    $nombre_ramo_editar = $_POST['nombreRamoEditar'];
    $nuevo_nombre_ramo = $_POST['nombreRamoEditarNuevo'];
    $codigo_ramo_editar = $_POST['codigoRamoEditar'];
    $periodo_ramo_editar = $_POST['periodoRamoEditar'];
    $año_ramo_editar = $_POST['añoRamoEditar'];
    $nivel_ramo_editar = $_POST['nivelRamoEditar'];
    $sede_ramo_editar = $_POST['sedeRamoEditar'];
    $carrera_ramo_editar = $_POST['carreraRamoEditar'];

    $query = "UPDATE ramos SET nombre_ramo='$nuevo_nombre_ramo', codigo_ramo='$codigo_ramo_editar', 
              periodo='$periodo_ramo_editar', año='$año_ramo_editar', nivel='$nivel_ramo_editar', 
              sede='$sede_ramo_editar', carrera='$carrera_ramo_editar' WHERE nombre_ramo='$nombre_ramo_editar'";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Ramo editado correctamente');window.location.href='dashboard.php';</script>";
    } else {
        echo "Error al editar el ramo: " . mysqli_error($conn);
    }
}
?>
