<?php
// connect to the database
require_once("include/connection.php");

// Uploads files
if (isset($_POST['save'])) { // if save button on the form is clicked
    // name of the uploaded file
    $user = $_POST['email'];
    $filename = $_FILES['myfile']['name'];

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
                window.location = "add_file.php";
              </script>';
    } elseif ($size > 100000000) { 
        echo "El archivo es demasiado grande para subir, el máximo es 100 mb!";
    } else {
        $query = mysqli_query($conn, "SELECT * FROM `upload_quimi_sant` WHERE `name` = '$filename'") or die(mysqli_error($conn));
        $counter = mysqli_num_rows($query);

        if ($counter == 1) {
            echo '
                <script type="text/javascript">
                    alert("El archivo ya existe");
                    window.location = "add_document.php";
                </script>';
        }

        date_default_timezone_set("America/Santiago");
        $time = date("d-M-Y H:i:s");
        echo $time;

        // move the uploaded (temporary) file to the specified destination
        if (move_uploaded_file($file, $destination)) {
            $sql = "INSERT INTO upload_quimi_sant (name, size, download, timers, admin_status, email) VALUES ('$filename', $size, 0, '$time', 'Admin', '$user')";
            if (mysqli_query($conn, $sql)) {
                echo '
                    <script type="text/javascript">
                        alert("File uploaded successfully");
                        window.location = "add_document.php";
                    </script>';
            }
        } else {
            echo "Error al cargar el archivo.";
        }
    }
}
?>