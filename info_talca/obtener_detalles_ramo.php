<?php
require_once("include/connection.php");

if (isset($_GET['codigo_ramo'])) {
    $codigoRamo = mysqli_real_escape_string($conn, $_GET['codigo_ramo']);

    $query = "SELECT codigo_ramo, nombre_ramo, periodo, año, nivel, sede, carrera FROM filemanagement_db.ramos WHERE codigo_ramo = '$codigoRamo'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        echo json_encode(array(
            'nombre_Ramo' => $row['nombre_ramo'],
            'codigo_ramo' => $row['codigo_ramo'],
            'periodo' => $row['periodo'],
            'año' => $row['año'],
            'nivel' => $row['nivel'],
            'sede' => $row['sede'],
            'carrera' => $row['carrera']
        ));
    } else {
        echo json_encode(array('error' => 'No se encontraron detalles para el código de ramo proporcionado.'));
    }
} else {
    echo json_encode(array('error' => 'No se proporcionó un código de ramo.'));
}

mysqli_close($conn);
?>
