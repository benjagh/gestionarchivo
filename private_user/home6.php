<!DOCTYPE html>
<html lang="en">
<?php
// include('Private_Dashboard/include/connection.php');
session_start();
if (!isset($_SESSION["email_address"])) {
    header("location:../login.html");
}
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
          /* Estilos para el contenedor del sidebar */
        .sidebar-fixed {
        background-color: #343a40; /* Color de fondo del sidebar */
        color: #fff; /* Color del texto en el sidebar */
        width: 250px; /* Ancho del sidebar */
        padding-top: 20px; /* Espaciado superior */
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

        #content {
            margin-left: 250px;
            padding: 15px;
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
        <a class="navbar-brand" href="home6.php"><img src="js/img/autonoma.png" width="204px" height="87px"> SISTEMA DE GESTIÓN DE ARCHIVOS </a>
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
                        <a class=> <i class="fas fa-chalkboard-teacher"></i> Usuario logeado</a>
                        <a class="dropdown-item" href="Logout.php"><i class="fas fa-sign-in-alt"></i> Cerrar sesión</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <br>
    <!--/.Navbar -->
    
    <br><Br><br><br>
    <div class="sidebar-fixed position-fixed">
    <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-folder-open"></i> Ver archivos cargados
        </a>
        <a href="add_file6.php" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-file-medical"></i> Agregar documentos
        </a>
        <a href="perfil6.php" class="list-group-item list-group-item-action waves-effect" >
            <i class="fas fa-user mr-3"></i>Perfil
        </a>
    </div>
</div>

   

    <!-- Content -->
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <hr>
                    <table id="dtable" class="table table-striped" style="">
                        <thead>
                            <th>Nombre del archivo</th>
                            <th>Tamaño</th>
                            <th>Subido por</th>
                            <th>Estado</th>
                            <th>Fecha de subida</th>
                            <th>Descargas</th>
                            <th>Acción</th>
                        </thead>
                        <tbody>
                            <tr>
                                <?php

                                require_once("include/connection.php");

                                $query = mysqli_query($conn, "SELECT ID, NAME, SIZE, EMAIL, ADMIN_STATUS, TIMERS, DOWNLOAD FROM upload_files WHERE ADMIN_STATUS = 'Ingeniería Civil Industrial' AND sede = 'Santiago' GROUP BY NAME DESC") or die(mysqli_error($conn));
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
                                    <td style=""><a href='downloads.php?file_id=<?php echo $id; ?>'><img src="img/698569-icon-57-document-download-128.png" width="30px" height="30px" title="Download File"></a> </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
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

</body>

</html>
