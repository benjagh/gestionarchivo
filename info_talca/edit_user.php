<?php
require_once("include/connection.php");

if (isset($_POST['edit'])) {
    // Obtener datos del formulario
    $user_id = mysqli_real_escape_string($conn, $_POST['user_id']);
    $user_name = mysqli_real_escape_string($conn, $_POST['user_name']);
    $user_username = mysqli_real_escape_string($conn, $_POST['user_username']);
    $user_status = mysqli_real_escape_string($conn, $_POST['user_status']);

    // Verificar si se proporcionó una nueva contraseña y no está vacía
    if (isset($_POST['user_password']) && !empty($_POST['user_password'])) {
        $user_password = mysqli_real_escape_string($conn, $_POST['user_password']);
        // Hashear la nueva contraseña
        $hashed_password = password_hash($user_password, PASSWORD_DEFAULT,array('cost' => 12));
        // Actualizar la base de datos con la nueva contraseña hasheada
        $update_query = "UPDATE `admin_login` SET `name` = '$user_name', `admin_user` = '$user_username', `admin_password` = '$hashed_password', `admin_status` = '$user_status' WHERE `id` = '$user_id'";
    } else {
        // No se proporcionó una nueva contraseña, mantener la contraseña existente
        $update_query = "UPDATE `admin_login` SET `name` = '$user_name', `admin_user` = '$user_username', `admin_status` = '$user_status' WHERE `id` = '$user_id'";
    }

    if ($conn->query($update_query)) {
        echo '
            <script type="text/javascript">
                alert("Editado exitosamente!");
                window.location = "view_admin.php";
            </script>
        ';
    } else {
        echo "Error updating record: " . $conn->error;
    }
}


?>

