<?php
require_once("include/connection.php");
if(isset($_POST['sede']) && isset($_POST['carrera'])) {
    $sede = $_POST['sede'];
    $carrera = $_POST['carrera'];

    $query_ramos = "SELECT id, nombre_ramo FROM ramos WHERE sede = '$sede' AND carrera = '$carrera'";
    $result_ramos = mysqli_query($conn, $query_ramos);

    while($row = mysqli_fetch_array($result_ramos)) {
        echo "<option value='" . $row['id'] . "'>" . $row['nombre_ramo'] . "</option>";
    }
}
?>
