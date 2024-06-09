<?php
require_once("include/connection.php");

if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // Utilizamos una sentencia preparada para evitar inyección de SQL
    $delete_query = $conn->prepare("DELETE FROM login_user WHERE id = ?");
    $delete_query->bind_param("i", $id);  // 'i' indica que es un entero (ID)

    try {
        if ($delete_query->execute()) {
            echo '
                <script type="text/javascript">
                    alert("Usuario eliminado exitosamente!");
                    window.location = "view_user.php";
                </script>
            ';
        } else {
            throw new Exception("Error deleting record: " . $delete_query->error);
        }
    } catch (mysqli_sql_exception $e) {
        if ($e->getCode() == 1451) { // Código de error para la restricción de clave externa
            echo '
                <script type="text/javascript">
                    alert("Elimine los ramos del usuario que quiere eliminar.");
                    window.location = "view_user.php";
                </script>
            ';
        } else {
            echo "Error: " . $e->getMessage();
        }
    }

    $delete_query->close();
} else {
    echo "ID del usuario no proporcionado.";
}
?>
