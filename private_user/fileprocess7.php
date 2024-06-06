<?php
// connect to the database
require_once("include/connection.php");

if (isset($_POST['save'])) { // if the save button on the form is clicked
    // name of the uploaded file
    $filename = $_FILES['myfile']['name'];

    // Get the email from the form
    $userEmail = $_POST['email']; // Make sure this field exists in your form and validate it

    // Get the selected ramo_id
    $ramoId = $_POST['ramo_id']; // Make sure to validate and sanitize this input as well

    // destination of the file on the server
    $destination = '../uploads/' . $filename;

    // get the file extension
    $extension = pathinfo($filename, PATHINFO_EXTENSION);

    // the physical file on a temporary uploads directory on the server
    $file = $_FILES['myfile']['tmp_name'];
    $size = $_FILES['myfile']['size'];

    $allowed_extensions = ['pdf', 'docx', 'doc', 'pptx', 'ppt', 'xlsx', 'xls', 'odt','jpg','png','jpeg'];

    if (!in_array($extension, $allowed_extensions)) {
        echo '<script type="text/javascript">
                alert("La extensión del archivo debe ser: .pdf, .docx, .doc, .pptx, .ppt, .xlsx, .xls, .odt, .jpg, .png o .jpeg");
                window.location = "add_file7.php";
              </script>';
    } elseif ($size > 100000000) { // file shouldn't be larger than 100 Megabytes
        echo "File too large!";
    } else {
        // Resto del código para cargar el archivo

        $query = mysqli_query($conn, "SELECT * FROM `upload_quimi_sant` WHERE `name` = '$filename'") or die(mysqli_error($conn));
        $counter = mysqli_num_rows($query);

        if ($counter == 1) {
            echo '
                <script type="text/javascript">
                    alert("El archivo ya ha sido cargado");
                    window.location = "home7.php";
                </script>';
        }

        date_default_timezone_set("America/Santiago");
        $time = date("d-M-Y H:i:s");

        if (move_uploaded_file($file, $destination)) {
            $sql = "INSERT INTO upload_quimi_sant (name, size, download, timers, admin_status, email, sede, ramo_id) VALUES ('$filename', $size, 0, '$time', 'Ingeniería Civil Química', '$userEmail', 'Santiago', '$ramoId')";
            if (mysqli_query($conn, $sql)) {
                echo '
                     <script type="text/javascript">
                    alert("Archivo cargado exitosamente");
                    window.location = "home7.php";
                </script>';
            }
        } else {
            echo "Error al cargar el archivo.";
        }
    }
}
?>
