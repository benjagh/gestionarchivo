<?php
require_once("include/connection.php");

if (isset($_POST['edit'])) {
    // Obtener datos del formulario
    $user_id = mysqli_real_escape_string($conn, $_POST['user_id']);
    $user_name = mysqli_real_escape_string($conn, $_POST['user_name']);
    $user_username = mysqli_real_escape_string($conn, $_POST['user_username']);
    $user_password = mysqli_real_escape_string($conn, $_POST['user_password']);
    $user_status = mysqli_real_escape_string($conn, $_POST['user_status']);

    // Hasheo de la contraseña
    $hashed_password = password_hash($user_password, PASSWORD_DEFAULT, array('cost' => 12));

    // Actualizar la base de datos utilizando el ID recibido del formulario
    $update_query = "UPDATE `login_user` SET `name` = '$user_name', `email_address` = '$user_username', `user_password` = '$hashed_password', `user_status` = '$user_status' WHERE `id` = '$user_id'";

    if ($conn->query($update_query)) {
        echo '
            <script type="text/javascript">
                alert("Editado exitosamente!");
                window.location = "view_user.php";
            </script>
        ';
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>