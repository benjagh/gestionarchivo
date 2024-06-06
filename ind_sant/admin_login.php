<?php
require_once("../include/connection.php");
session_start();

// Verificación del captcha
if (isset($_POST['captcha']) && $_POST['captcha'] == $_SESSION['captcha']) {
    // El captcha es correcto, continúa con la validación del usuario y la contraseña
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
            $_SESSION["admin_user"] = $row["admin_user"];

            if (password_verify($password, $row["admin_password"])) {
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
            echo "<script type='text/javascript'>alert('Contraseña incorrecta, por favor intente nuevamente.');
            document.location='index.html'</script>";
        }
    }

    date_default_timezone_set("America/Santiago");
    $time = date("d-M-Y H:i:s");
    echo $time;
}}else {
    // El captcha no es correcto
    echo "<script type='text/javascript'>alert('Código de captcha incorrecto, por favor intente nuevamente.');
    document.location='index.html'</script>";
}
?>