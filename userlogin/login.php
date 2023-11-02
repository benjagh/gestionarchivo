<?php
require_once("../include/connection.php");
session_start();

if (isset($_POST["logIn"])) {
    date_default_timezone_set("America/Santiago");
        $time = date("d-M-Y H:i:s");
        echo $time;

    $username = mysqli_real_escape_string($conn, $_POST["email_address"]);
    $password = mysqli_real_escape_string($conn, $_POST["user_password"]);

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
            $_SESSION["carrera"] = $carrera;
            $_SESSION["sede"] = $sede;

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

                mysqli_query($conn, "INSERT INTO history_log(id,email_address,action,ip,host,login_time) VALUES('$id','$user','$remarks','$ip','$host','$date')") or die(mysqli_error($conn));

                // Redirigir a la página correspondiente según la carrera y sede
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
                }else{
                    echo "<script type='text/javascript'>alert('Combinación de carrera y sede no válida.');
                          document.location='../login.html'</script>";
                }
            } else {
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
