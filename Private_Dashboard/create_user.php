<?php
require_once("include/connection.php");

function validarRut($rut) {
    // Formato esperado del RUT: 12345678-9
    $rutRegex = '/^(\d{1,2}\.\d{3}\.\d{3}-[\dkK])|(\d{8}-[\dkK])$/';

    if (!preg_match($rutRegex, $rut)) {
        return false; // El RUT no cumple con el formato
    }

    $rut = str_replace('.', '', $rut); // Eliminar puntos si están presentes
    list($rutNumero, $rutVerificador) = explode('-', $rut);

    $suma = 0;
    $multiplo = 2;

    for ($i = strlen($rutNumero) - 1; $i >= 0; $i--) {
        $suma += intval($rutNumero[$i]) * $multiplo;
        $multiplo = $multiplo === 7 ? 2 : $multiplo + 1;
    }

    $resultado = $suma % 11 === 0 ? 0 : 11 - ($suma % 11);
    $verificador = strtolower($rutVerificador) === 'k' ? 10 : intval($rutVerificador);

    return $resultado === $verificador;
}

if (isset($_POST['reguser'])) {
    $user_name = mysqli_real_escape_string($conn, $_POST['name']);
    $email_address = mysqli_real_escape_string($conn, $_POST['email_address']);
    $user_password = password_hash($_POST['user_password'], PASSWORD_DEFAULT, array('cost' => 12)); // PASSWORD_ARGON2I//PASSWORD_ARGON2ID
    $user_status = mysqli_real_escape_string($conn, $_POST['user_status']);
    $fecha_de_nacimiento = mysqli_real_escape_string($conn, $_POST['fecha_de_nacimiento']);
    $rut = mysqli_real_escape_string($conn, $_POST['rut']);
    $carrera = mysqli_real_escape_string($conn, $_POST['carrera']);
    $sede = mysqli_real_escape_string($conn, $_POST['sede']);

    // Inicializar la variable $foto_de_perfil
    $foto_de_perfil = '';

    // Verificar si se ha cargado una foto de perfil
    if (!empty($_FILES['foto_de_perfil']['name'])) {
        $foto_de_perfil = $_FILES['foto_de_perfil']['name'];
        $tmp_foto_de_perfil = $_FILES['foto_de_perfil']['tmp_name'];

        // Mover el archivo si se ha cargado
        if (!move_uploaded_file($tmp_foto_de_perfil, "../private_user/uploads/" . $foto_de_perfil)) {
            echo '<script type="text/javascript">alert("Error al cargar la foto"); window.location = "dashboard.php";</script>';
            exit();
        }
    }

    // Validar el RUT
    if (!validarRut($rut)) {
        echo '<script type="text/javascript">alert("El RUT ingresado no es válido."); window.location = "dashboard.php";</script>';
    } else {
        // Verificar si el correo ya está en uso
        $q_checkadmin = $conn->query("SELECT * FROM `login_user` WHERE `email_address` = '$email_address'") or die(mysqli_error());
        $v_checkadmin = $q_checkadmin->num_rows;

        // Verificar si el RUT ya está en uso
        $q_checkrut = $conn->query("SELECT * FROM `login_user` WHERE `rut` = '$rut'") or die(mysqli_error());
        $v_checkrut = $q_checkrut->num_rows;

        // Agregar mensajes de depuración
        if ($v_checkadmin > 0 && $v_checkrut > 0) {
            echo '<script type="text/javascript">alert("El correo y el RUT ya han sido utilizados"); window.location = "dashboard.php";</script>';
        } elseif ($v_checkadmin > 0) {
            echo '<script type="text/javascript">alert("El correo ya ha sido utilizado"); window.location = "dashboard.php";</script>';
        } elseif ($v_checkrut > 0) {
            echo '<script type="text/javascript">alert("El RUT ya ha sido utilizado"); window.location = "dashboard.php";</script>';
        } else {
            // Insertar usuario si el correo y el RUT no están en uso y el RUT es válido
            $insert_query = "INSERT INTO `login_user` VALUES('', '$user_name', '$email_address', '$user_password', '$user_status', '$fecha_de_nacimiento', '$rut', '$carrera', '$sede', '$foto_de_perfil')";

            if ($conn->query($insert_query)) {
                echo '<script type="text/javascript">alert("Información Guardada"); window.location = "dashboard.php";</script>';
            } else {
                echo '<script type="text/javascript">alert("Error al insertar el usuario"); window.location = "dashboard.php";</script>';
            }
        }
    }
}
?>
