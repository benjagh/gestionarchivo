<?php
require_once("../include/connection.php");
session_start();

if (isset($_POST["adminlog"])) {
    $username = mysqli_real_escape_string($conn, $_POST["admin_user"]);
    $password = mysqli_real_escape_string($conn, $_POST["admin_password"]);

    $query = mysqli_query($conn, "SELECT * FROM admin_login WHERE admin_user = '$username'") or die(mysqli_error($conn));
    $row = mysqli_fetch_array($query);
    $counter = mysqli_num_rows($query);

    if ($counter == 0) {
        echo "<script type='text/javascript'>alert('Dirección de correo electrónico o contraseña incorrectos, por favor intente nuevamente.');
        document.location='index.html'</script>";
    } else {
        $id = $row['id'];
        $admin = $row['admin_user'];
        $adminStatus = $row['admin_status']; // Obtiene el admin_status del usuario

        if (password_verify($password, $row["admin_password"]) && ($adminStatus === "Secretaria" || $adminStatus === "Decano")) {
            $_SESSION['admin_user'] = $id;

            if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
                $ip = $_SERVER["HTTP_CLIENT_IP"];
            } elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
                $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
            } else {
                $ip = $_SERVER["REMOTE_ADDR"];
            }

            $host = gethostbyaddr($_SERVER['REMOTE_ADDR']);
            $remarks = "Ha iniciado sesión en el sistema a las";
            date_default_timezone_set("America/Santiago");
            $time = date("d-M-Y H:i:s");
            mysqli_query($conn, "INSERT INTO history_log1(id, admin_user, action, ip, host, login_time) VALUES ('$id', '$admin', '$remarks', '$ip', '$host', '$time')") or die(mysqli_error($conn));

            echo "<script type='text/javascript'>document.location='dashboard.php'</script>";
        } else {
            echo "<script type='text/javascript'>alert('No tienes permiso para acceder. Contraseña incorrecta o rol incorrecto.');
            document.location='index.html'</script>";
        }
    }
}
?>
