<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if (!isset($_SESSION["email_address"])) {
    header("location:../login.html");
    exit(); // Asegura que el script se detenga después de redirigir
}

require_once("include/connection.php");

// Obtén la información del usuario
$id = mysqli_real_escape_string($conn, $_SESSION['email_address']);
$r = mysqli_query($conn, "SELECT * FROM login_user WHERE id = '$id'") or die(mysqli_error($conn));
$row = mysqli_fetch_array($r);
$email_address = $row['email_address'];
// Verifica la carrera y la sede del usuario
$carrera = $row['carrera']; // Asegúrate de que el nombre de la columna sea correcto
$sede = $row['sede']; // Asegúrate de que el nombre de la columna sea correcto

if ($carrera != 'Ingeniería Civil Informática' || $sede != 'Sede Santiago') {
    // El usuario no tiene permisos para acceder
    echo "<script>alert('No tienes permisos para acceder a esta página.');";
    echo "window.history.back();</script>";
    exit();
}

$user_id = $id;
$queryRamos = "
SELECT r.id, r.nombre_ramo 
FROM ramos r
INNER JOIN usuarios_ramos ur ON r.id = ur.ramo_id 
WHERE ur.user_id = '$user_id'
";
$result_ramos = mysqli_query($conn, $queryRamos) or die(mysqli_error($conn));

?>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sistema Gestor de Archivos</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Sistema Gestor de Archivos -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.css" rel="stylesheet">


    <!-- Add custom CSS for sidebar -->
    <style>
        .navbar {
        background-color: #dd211c !important;
        }
         

        /* Estilos para el logo */
        .logo-wrapper img {
        display: block;
        margin: 0 auto;
        }

        /* Estilos para los elementos de la lista */
        .list-group-item {
        background-color: transparent; /* Fondo transparente */
        border: none; /* Sin borde */
        color: #fff; /* Color del texto en los elementos */
        transition: background-color 0.3s, color 0.3s; /* Transición de colores */
        }

        .list-group-item:hover {
        background-color: #dd211c; /* Color de fondo al pasar el mouse */
        color: #fff; /* Color del texto al pasar el mouse */
        }

        /* Estilos para el ícono en los elementos */
        .list-group-item i {
        margin-right: 10px; /* Espacio a la derecha del ícono */
        }

        /* Estilos para el enlace activo */
        .list-group-item.active {
        background-color: #dd211c; /* Color de fondo del elemento activo */
        }

        /* Estilos para el enlace al hacer clic */
        .list-group-item:active {
        background-color: #dd211c;
        }

        /* Estilos para el enlace visitado */
        .list-group-item:visited {
        background-color: #dd211c;
        }

        /* Estilos para el enlace al pasar el mouse */
        .list-group-item.list-group-item-action.waves-effect:hover {
        background-color: #dd211c;
        color: #fff; /* Color del texto al pasar el mouse */
        }
        body {
            padding: 0;
            margin: 0;
            background-color: #fff;
            font-family: arial, helvetica, sans-serif, verdana, 'Open Sans';
        }

        #sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: -250px;
            background-color: #333;
            color: #fff;
            transition: left 0.3s;
        }

        #sidebar.active {
            left: 0;
        }

        #sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        #sidebar ul li {
            padding: 15px;
            text-align: center;
        }

        #sidebar ul li i {
            font-size: 24px;
        }
 /* Estilos para el contenedor del sidebar */
 .sidebar-fixed {
        background-color: #343a40; /* Color de fondo del sidebar */
        color: #fff; /* Color del texto en el sidebar */
        height: 100vh; /* Altura del sidebar para ocupar toda la pantalla vertical */
        width: 250px; /* Ancho del sidebar */
        position: fixed; /* Mantener fijo */
        top: 0;
        left: 0; /* Alineado a la izquierda */
        padding-top: 130px; /* Espaciado superior */
        z-index: 1; /* Asegura que esté encima del contenido */
        overflow-y: auto; /* Agrega desplazamiento vertical si es necesario */
        transition: width 0.3s ease; /* Agrega una transición suave */
    }
        #content {
        margin-left: 250px; /* Margen izquierdo para dejar espacio al sidebar */
        padding: 15px;
        transition: margin-left 0.3s ease; /* Transición suave para el margen izquierdo */
    }
    @media (max-width: 768px) {
    /* Estilo para el botón de hamburguesa en el navbar */
    .navbar-toggler {
        display: block; /* Mostrar el botón de hamburguesa en dispositivos pequeños */
    }

    /* Ocultar el sidebar por defecto en pantallas más pequeñas */
    .sidebar-fixed {
        width: 0;
        /* ... (otros estilos de ocultamiento) ... */
    }

    /* Estilos para el contenido principal */
    #content {
        margin-left: 0; /* Ajustar el margen para el contenido principal */
    }

    /* Mostrar el sidebar cuando está activo (al hacer clic en la hamburguesa) */
    .sidebar-fixed.active {
        width: 250px; /* Ancho del sidebar */
        /* ... (otros estilos al activar) ... */
    }

}
    </style>

</head>

<body>
    <?php

    require_once("include/connection.php");

    $id = mysqli_real_escape_string($conn, $_SESSION['email_address']);

    $r = mysqli_query($conn, "SELECT * FROM login_user where id = '$id'") or die(mysqli_error($con));

    $row = mysqli_fetch_array($r);

    $id = $row['email_address'];
    // $fname=$row['fname'];
    // $lname=$row['lname'];

    ?>
    <!-- Start your project here-->
    <!--Navbar -->
    <nav class="mb-1 navbar navbar-expand-lg navbar-dark red fixed-top">
        <a class="navbar-brand" href="home5.php"><img src="js/img/autonoma.png" width="204px" height="87px"> SISTEMA DE GESTIÓN DE ARCHIVOS </a>
        <button class="navbar-toggler" type="button" id="sidebarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <font color="white">Bienvenido!,</font> <?php echo ucwords(htmlentities($id)); ?> <i class="fas fa-user-circle"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                        <a class="dropdown-item" href="Logout.php"><i class="fas fa-sign-in-alt"></i> Cerrar sesión</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <br>
    <!--/.Navbar -->
    
    <br><Br><br><br>


<!-- Tu estructura de sidebar -->
<div class="sidebar-fixed position-fixed">
    <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-folder-open"></i> Ver archivos cargados
        </a>
        <a href="add_file5.php" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-file-medical"></i> Agregar documentos
        </a>
        <a href="perfil5.php" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-user mr-3"></i>Perfil
        </a>
        <!-- <a href="recibidos.php" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-share-alt"></i> Archivos recibidos 
        </a> -->
    </div> 
</div>

   

    <!-- Content -->
    <div class='container'>
    <div class='row'>
        <div class='col-md-12'>
                <hr>
                
                <!-- Añadir filtro de ramos -->
                <label for="filtroRamo">Filtrar por ramo:  <i class="fas fa-folder-open"></i></label>
                <select id="filtroRamo" name="filtroRamo">
                    <option value="" selected disabled>Seleccionar ramo </option>
                    <?php while($ramo = mysqli_fetch_assoc($result_ramos)): ?>
                        <option  value="<?= htmlspecialchars($ramo['id']); ?>"><?= htmlspecialchars($ramo['nombre_ramo']); ?></option>
                    <?php endwhile; ?>
                </select>
                <div style="margin-top: 20px;">
                    <!-- <label for="email">Email utilizado para filtrar: </label>-->
                    <input type="hidden" id="emailInput" name="email" value="<?php echo htmlspecialchars($email_address); ?>">


                </div>
                <!-- Tabla oculta inicialmente -->
                <div id="tablaRamos" style="display: none;">
                        <thead>
                            <th>Nombre del archivo</th>
                            <th>Tamaño</th>
                            <th>Subido por</th>
                            <th>Carrera</th> 
                            <th>Fecha de subida</th>
                            <th>Descargas</th>
                            <th>Acción</th>
                        </thead>
                        <tbody>
                        <tr>
                            <?php
                            require_once("include/connection.php");

                            // La consulta filtra los archivos por el correo electrónico del usuario
                            $query = mysqli_query($conn, "SELECT ID, NAME, SIZE, EMAIL, ADMIN_STATUS, TIMERS, DOWNLOAD FROM upload_info_sant WHERE EMAIL = '$id' ORDER BY NAME DESC") or die(mysqli_error($conn));
                            while ($file = mysqli_fetch_array($query)) {
                                $id =  $file['ID'];
                                $name =  $file['NAME'];
                                $size =  $file['SIZE'];
                                $uploads =  $file['EMAIL'];
                                $status =  $file['ADMIN_STATUS'];
                                $time =  $file['TIMERS'];
                                $download =  $file['DOWNLOAD'];
                                ?>

                                <td width="17%"><?php echo  $name; ?></td>
                                <td><?php echo floor($size / 1000) . ' KB'; ?></td>
                                <td><?php echo $uploads; ?></td>
                                <td><?php echo $status; ?></td>
                                <td><?php echo $time; ?></td>
                                <td><?php echo $download; ?></td>
                                <td style=""><a href='downloads.php?file_id=<?php echo $id; ?>'><img src="img/download-icon.png.png" width="30px" height="30px" title="Descargar archivo"></a></td>
                                
                            </tr>
                        <?php } ?>
                    </tbody>
            </div>
        </div>
    </div>
</div>
    <!-- /Content -->
    <!-- /Start your project here-->

    <!-- SCRIPTS -->
    <!-- Bootstrap CSS -->


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/mdb.min.js"></script>

    <!-- DataTables CSS and JavaScript -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>

    <!-- DataTables Responsive CSS and JavaScript -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/1.0.3/css/dataTables.responsive.css">
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/1.0.3/js/dataTables.responsive.js"></script>

    <script>
        // Toggle sidebar
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });

            // Initialize DataTables
            $('#dtable').DataTable({
                responsive: true,
                searching: true, // Enable search
                paging: true, // Enable pagination
                pageLength: 10 // Number of rows per page
            });
        });
    </script>
   <script>
        // Toggle sidebar
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });

            // Initialize DataTables
            $('#dtable').DataTable({
                responsive: true,
                searching: true, // Enable search
                paging: true, // Enable pagination
                pageLength: 10 // Number of rows per page
            });
        });
    </script>
   <script>
    document.addEventListener("DOMContentLoaded", function() {
        const sidebar = document.querySelector('.sidebar-fixed');
        const toggleBtn = document.getElementById('sidebarToggleBtn');

        toggleBtn.addEventListener('click', function() {
            if (sidebar.style.display === 'none' || sidebar.style.display === '') {
                sidebar.style.display = 'block';
                toggleBtn.textContent = 'Ocultar Menú';
            } else {
                sidebar.style.display = 'none';
                toggleBtn.textContent = 'Mostrar Menú';
            }
        });
    });
</script>
<script>
document.getElementById('filtroRamo').addEventListener('change', function() {
    var ramoId = this.value; // Obtén el ID del ramo seleccionado
    var email = document.getElementById('emailInput').value; // Obtén el correo electrónico del campo de entrada

    if(ramoId) {
        // Realiza una solicitud AJAX para obtener los archivos filtrados
        $.ajax({
            url: 'ruta5.php', // Especifica la ruta a tu archivo PHP
            type: 'POST',
            data: {
                ramoId: ramoId,
                email: email // Envía el correo electrónico junto con el ramoId
            },
            success: function(data) {
                // Actualiza la tabla con los nuevos datos
                var tablaRamos = document.getElementById('tablaRamos');
                tablaRamos.style.display = 'block'; // Muestra la tabla
                tablaRamos.innerHTML = data; // Inserta los datos en la tabla
                
                // Vuelve a inicializar DataTables en la nueva tabla
                $('#dtable').DataTable({
                    // Opciones de DataTables, si es necesario configurarlas
                    // Por ejemplo, para destruir la instancia anterior y crear una nueva:
                    destroy: true
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Manejar errores de la solicitud AJAX aquí
                console.log(textStatus, errorThrown);
            }
        });
    } else {
        // Oculta la tabla si no hay selección de ramo
        document.getElementById('tablaRamos').style.display = 'none';
    }
});

</script>
<script>
function compartirArchivo(fileId) {
    var hash = generarHash(); // Genera un hash único para el proceso de compartir
    document.cookie = "shareHash=" + hash + "; path=/"; // Guarda el hash en una cookie

    // Llama a un script PHP pasando el ID del archivo y el hash como parámetros
    window.location.href = "compartir_archivo.php?file_id=" + fileId + "&hash=" + hash;
}

function generarHash() {
    // Implementa la lógica para generar un hash único, por ejemplo, usando la fecha y hora actual y algún identificador único del usuario
    return new Date().getTime() + "_" + Math.random().toString(36).substring(2, 15);
}
</script>



<script>
// Función para abrir el modal y cargar usuarios
function openModal(fileId) {
    var modal = document.getElementById('shareModal');
    if (modal) {
        modal.style.display = 'block';
        // Aquí puedes hacer cualquier otra cosa que necesites al abrir el modal, como cargar los usuarios desde la base de datos
        // Por ejemplo, puedes realizar una solicitud AJAX para cargar los usuarios disponibles para compartir el archivo
        // Aquí hay un ejemplo básico de cómo podrías hacerlo con jQuery
        $.ajax({
            url: 'cargar_usuarios.php',
            type: 'GET',
            data: { fileId: fileId },
            success: function(response) {
                // Aquí puedes manejar la respuesta y agregar los usuarios al modal
                // Por ejemplo, podrías actualizar el contenido del modal con los usuarios cargados
                $('#shareModalContent').html(response);
            },
            error: function(xhr, status, error) {
                // Manejar errores si la solicitud AJAX falla
                console.error(error);
            }
        });
    }
}

// Función para cerrar el modal
function closeModal() {
    var modal = document.getElementById('shareModal');
    if (modal) {
        modal.style.display = 'none';
        // Aquí puedes hacer cualquier otra cosa que necesites al cerrar el modal
    }
}

// Cerrar el modal si se hace clic fuera de él
window.onclick = function(event) {
    var modal = document.getElementById('shareModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>

</html>
