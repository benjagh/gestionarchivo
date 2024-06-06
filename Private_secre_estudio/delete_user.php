<?php
require_once("include/connection.php");

if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // Utilizamos una sentencia preparada para evitar inyección de SQL
    $delete_query = $conn->prepare("DELETE FROM login_user WHERE id = ?");
    $delete_query->bind_param("i", $id);  // 'i' indica que es un entero (ID)

    if ($delete_query->execute()) {
        echo '
            <script type="text/javascript">
                alert("Usuario eliminado exitosamente!");
                window.location = "view_user.php";
            </script>
        ';
    } else {
        echo "Error deleting record: " . $conn->error;
    }

    $delete_query->close();
} else {
    echo "ID del usuario no proporcionado.";
}
?>
