<?php
require_once("../include/connection.php");
session_start();

// Verificar si la variable de sesión 'login_attempts' existe
if (!isset($_SESSION['login_attempts'])) {
    $_SESSION['login_attempts'] = 0;
}

// Definir límite de intentos y tiempo de bloqueo (5 intentos y 1 minuto)
$intentos_limite = 5;
$tiempo_bloqueo = 60; // en segundos

if (isset($_POST["logIn"])) {
    date_default_timezone_set("America/Santiago");
    $time = date("d-M-Y H:i:s");

    $username = mysqli_real_escape_string($conn, $_POST["email_address"]);
    $password = mysqli_real_escape_string($conn, $_POST["user_password"]);
    $captcha = mysqli_real_escape_string($conn, $_POST["captcha"]); // Agregamos el captcha

    // Validación del captcha
    if ($_SESSION['captcha'] != $captcha) {
        echo "<script type='text/javascript'>alert('Captcha incorrecto.');
              document.location='../login.html'</script>";
        exit(); // Salir del script si el captcha es incorrecto
    }

    // Verificar si la cuenta está bloqueada
    if (isset($_SESSION['bloqueado_hasta']) && $_SESSION['bloqueado_hasta'] > time()) {
        echo "<script type='text/javascript'>alert('Has excedido el límite de intentos. La cuenta está bloqueada por 1 minuto.');
              document.location='../login.html'</script>";
        exit(); // Salir del script si la cuenta está bloqueada
    }

    $query = mysqli_query($conn, "SELECT * FROM login_user WHERE email_address = '$username'") or die(mysqli_error($conn));

    if ($query) {
        $row = mysqli_fetch_array($query);

        if ($row) {
            $id = $row['id'];
            $user = $row['email_address'];
            $carrera = $row['carrera'];
            $sede = $row['sede'];

            $_SESSION["user_no"] = $row["id"];
            $_SESSION["email_address"] = $row["email_address"];
            $_SESSION["carrera"] = $row["carrera"];
            $_SESSION["sede"] = $row["sede"];

            if (password_verify($password, $row["user_password"])) {
                $_SESSION['email_address'] = $id;

                if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
                    $ip = $_SERVER["HTTP_CLIENT_IP"];
                } elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
                    $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
                } else {
                    $ip = $_SERVER["REMOTE_ADDR"];
                }

                $host = gethostbyaddr($_SERVER['REMOTE_ADDR']);

                $remarks = "Has LoggedIn the system at";

                mysqli_query($conn, "INSERT INTO history_log (id,email_address,action,ip,host,login_time) VALUES('$id','$user','$remarks','$ip','$host','$time')") or die(mysqli_error($conn));

            }
            // Verificar si las credenciales son válidas
            if (password_verify($password, $row["user_password"])) {
                $_SESSION['email_address'] = $id;
                if (isset($_POST["remember"])) {
                    // Incluir tanto el correo electrónico como la contraseña en la cookie
                    $cookie_value = base64_encode($username . '|' . $password);
                    setcookie("user_data", $cookie_value, time() + (86400 * 30), "/"); // Cookie válida por 30 días
                }
                if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
                    $ip = $_SERVER["HTTP_CLIENT_IP"];
                } elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
                    $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
                } else {
                    $ip = $_SERVER["REMOTE_ADDR"];
                }

                $host = gethostbyaddr($_SERVER['REMOTE_ADDR']);
                $remarks = "Has LoggedIn the system at";

                mysqli_query($conn, "INSERT INTO history_log(id,email_address,action,ip,host,login_time) VALUES('$id','$user','$remarks','$ip','$host','$time')") or die(mysqli_error($conn));

                // Redirección según la carrera y sede
                if ($carrera === "Ingeniería Civil Informática" && $sede === "Sede Talca") {
                    echo "<script type='text/javascript'>document.location='../private_user/home.php'</script>";
                } elseif ($carrera === "Ingeniería Civil Industrial" && $sede === "Sede Talca") {
                    echo "<script type='text/javascript'>document.location='../private_user/home2.php'</script>";
                } elseif ($carrera === "Ingeniería Civil Informática" && $sede === "Sede Temuco") {
                    echo "<script type='text/javascript'>document.location='../private_user/home3.php'</script>";
                } elseif ($carrera === "Ingeniería Civil Industrial" && $sede === "Sede Temuco") {
                    echo "<script type='text/javascript'>document.location='../private_user/home4.php'</script>";
                } elseif ($carrera === "Ingeniería Civil Informática" && $sede === "Sede Santiago") {
                    echo "<script type='text/javascript'>document.location='../private_user/home5.php'</script>";
                } elseif ($carrera === "Ingeniería Civil Industrial" && $sede === "Sede Santiago") {
                    echo "<script type='text/javascript'>document.location='../private_user/home6.php'</script>";
                } elseif ($carrera === "Ingeniería Civil Química" && $sede === "Sede Santiago") {
                    echo "<script type='text/javascript'>document.location='../private_user/home7.php'</script>";
                } else {
                    echo "<script type='text/javascript'>alert('Combinación de carrera y sede no válida.');
                          document.location='../login.html'</script>";
                }
            } else {
                // Incrementar el contador de intentos fallidos
                $_SESSION['login_attempts']++;

                // Verificar si se excedió el límite de intentos
                if ($_SESSION['login_attempts'] >= $intentos_limite) {
                    // Establecer el tiempo de bloqueo
                    $_SESSION['bloqueado_hasta'] = time() + $tiempo_bloqueo;
                    echo "<script type='text/javascript'>alert('Has excedido el límite de intentos. La cuenta está bloqueada por 1 minuto.');
                          document.location='../login.html'</script>";
                    exit(); // Salir del script después del bloqueo
                }

                echo "<script type='text/javascript'>alert('Contraseña incorrecta. Inténtalo de nuevo.');
                      document.location='../login.html'</script>";
            }
        } else {
            echo "<script type='text/javascript'>alert('No se encontró un usuario con esta dirección de correo electrónico.');
                  document.location='../login.html'</script>";
        }
    } else {
        echo "<script type='text/javascript'>alert('Error en la consulta SQL: " . mysqli_error($conn) . "');
              document.location='../login.html'</script>";
    }
}
?>
