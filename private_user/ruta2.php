<?php
require_once("include/connection.php");

if (isset($_POST['ramoId']) && isset($_POST['email'])) {
    $ramoId = mysqli_real_escape_string($conn, $_POST['ramoId']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);

    $query = "SELECT * FROM upload_ind_talca WHERE ramo_id = ? AND EMAIL = ? ORDER BY NAME DESC";
    if ($stmt = mysqli_prepare($conn, $query)) {
        mysqli_stmt_bind_param($stmt, "is", $ramoId, $email);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        echo "<div class='container'>";
        echo "<div class='row'>";
        echo "<div class='col-md-12'>";
        echo "<hr>";
        
        echo "<table id='dtable' class='table table-striped'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th class='text-center'>Nombre del archivo</th>";
        echo "<th class='text-center'>Tamaño</th>";
        echo "<th class='text-center'>Subido por</th>";
        echo "<th class='text-center'>Carrera</th>";
        echo "<th class='text-center'>Fecha de subida</th>";
        echo "<th class='text-center'>Descargas</th>";
        echo "<th class='text-center'>Acción</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        while ($file = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td class='text-center'>" . htmlspecialchars($file['NAME']) . "</td>";
            echo "<td class='text-center'>" . floor($file['SIZE'] / 1000) . " KB</td>";
            echo "<td class='text-center'>" . htmlspecialchars($file['EMAIL']) . "</td>";
            echo "<td class='text-center'>" . htmlspecialchars($file['ADMIN_STATUS']) . "</td>";
            echo "<td class='text-center'>" . htmlspecialchars($file['TIMERS']) . "</td>";
            echo "<td class='text-center'>" . htmlspecialchars($file['DOWNLOAD']) . "</td>";
            echo "<td class='text-center'><a href='downloads2.php?file_id=" . htmlspecialchars($file['id']) . "'><img src='img/download-icon.png' width='30px' height='30px' title='Download File'></a></td>";
           echo "</td>";
            
            
            echo "</tr>";
        }

        echo "</tbody>";
        echo "</table>";
        echo "</div>";
        echo "</div>";
        echo "</div>";

        mysqli_stmt_close($stmt);
    } else {
        echo "Error: " . mysqli_error($conn);
    }
} else {
    echo "No se proporcionó ramoId o email.";
}
?>

<div id='shareModal' class='modal'>
    <div class='modal-content'>
        <span class='close' onclick='closeModal()'>&times;</span>
        <h2>Compartir Archivo</h2>
        <p>Por favor, selecciona a los usuarios con los que deseas compartir el archivo:</p>
        <div id='container'>
          <!-- El formulario HTML en el archivo compartido -->
<form id='shareForm' action='compartir_archivo.php' method='post'>
    <input type='hidden' name='id' value='' id='hiddenFileId'>
    <?php
    $query = "SELECT id, name, sede, carrera FROM login_user ORDER BY name";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<input type='checkbox' name='users[]' value='" . htmlspecialchars($row['id']) . "'> " . htmlspecialchars($row['name']) . " - Sede: " . htmlspecialchars($row['sede']) . " - Carrera: " . htmlspecialchars($row['carrera']) . "<br>";
        }
    } else {
        echo "No se encontraron usuarios disponibles para compartir el archivo.";
    }
    mysqli_free_result($result);
    ?>
    <br>
    <center><input type='submit' class='btn-compartir' value='Compartir'></center>
</form>

        </div>
    </div>
</div>
