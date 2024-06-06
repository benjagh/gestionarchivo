<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if (!isset($_SESSION["email_address"])) {
    echo "<script>window.location.href = '../login.html';</script>";
    exit(); // Asegura que el script se detenga después de redirigir
}

require_once("include/connection.php");

// Obtén la información del usuario
$id = mysqli_real_escape_string($conn, $_SESSION['email_address']);
$r = mysqli_query($conn, "SELECT * FROM login_user WHERE id = '$id'") or die(mysqli_error($conn));
$row = mysqli_fetch_array($r);

// Verifica la carrera y la sede del usuario
$carrera = $row['carrera']; // Asegúrate de que el nombre de la columna sea correcto
$sede = $row['sede']; // Asegúrate de que el nombre de la columna sea correcto

if ($carrera != 'Ingeniería Civil Química' || $sede != 'Sede Santiago') {
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


<!-- 
<link href="css/addons/datatables.min.css" rel="stylesheet">
<script href="js/addons/datatables.min.js" rel="stylesheet"></script>
<link href="css/addons/datatables-select.min.css" rel="stylesheet">
<script href="js/addons/datatables-select.min.js" rel="stylesheet"></script> -->


<!-- <link rel="stylesheet" id="font-awesome-style-css" href="http://phpflow.com/code/css/bootstrap3.min.css" type="text/css" media="all">
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script> -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="media/css/dataTable.css" />
    <script src="media/js/jquery.dataTables.js" type="text/javascript"></script>
    <!-- end table-->
    <script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
      $('#dtable').dataTable({
                "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
                "iDisplayLength": 10
            });
  })
    </script>
    <style type="text/css">
      /* Estilos para el contenedor del sidebar */
      

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
      .navbar {
        background-color: #dd211c !important;
        }
      select[multiple], select[size] {
    height: auto;
    width: 20px;
}
.pull-right {
    float: right;
    margin: 2px !important;
}
input[type=file] {
    border: 2px dotted #999;
    border-radius: 10px;
    margin-left: 9px;
    width: 231px!important;
}  
  .map-container{
overflow:hidden;
padding-bottom:56.25%;
position:relative;
height:0;
}

.md-form .form-control:disabled, .md-form .form-control[readonly] {
    border-bottom: 1px solid #bdbdbd;
    background-color: transparent;
    width: 215px !important;
}
     #loader{
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 9999;
        background: url('img/lg.flip-book-loader.gif') 50% 50% no-repeat rgb(249,249,249);
        opacity: 1;
    }
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
  </style>

    <script src="jquery.min.js"></script>
<script type="text/javascript">
  $(window).on('load', function(){
    //you remove this timeout
    setTimeout(function(){
          $('#loader').fadeOut('slow');  
      });
      //remove the timeout
      //$('#loader').fadeOut('slow'); 
  });
</script>

</head>

<body style="padding:0px; margin:0px; background-color:#fff;font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">
  <?php 

     require_once("include/connection.php");


   $id = mysqli_real_escape_string($conn,$_SESSION['email_address']);


  $r = mysqli_query($conn,"SELECT * FROM login_user where id = '$id'") or die (mysqli_error($con));

  $row = mysqli_fetch_array($r);

  $id=$row['email_address'];
  $user_status=$row['user_status'];
  $email_address=$row['email_address'];
   // $lname=$row['lname'];

?>
  <!-- Start your project here-->
  <!--Navbar -->
  <nav class="mb-1 navbar navbar-expand-lg navbar-dark red fixed-top">
        <a class="navbar-brand" href="home7.php"><img src="js/img/autonoma.png" width="204px" height="87px"> SISTEMA DE GESTIÓN DE ARCHIVOS </a>
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
<br>
<br><Br><br>
<div class="sidebar-fixed position-fixed">
    <div class="list-group list-group-flush">
        <a href="home7.php" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-folder-open mr-3"></i>Ver archivos cargados
        </a>
        <a href="#" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-file-medical mr-3"></i>Agregar documentos
        </a>
        <a href="perfil7.php" class="list-group-item list-group-item-action waves-effect">
            <i class="fas fa-user mr-3"></i>Perfil
        </a>
        <!-- <a href="recibidos.php" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-share-alt"></i> Archivos recibidos 
        </a> -->
    </div>
</div>

  <!--Main Navigation-->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container">

      <!-- Heading -->
      <div class="card mb-4 wow fadeIn">

        <!--Card content-->
        <div class="card-body d-sm-flex justify-content-between">

          <h4 class="mb-2 mb-sm-0 pt-1">
   

          <div class="d-flex justify-content-center pull-right">
       
            <a href="home7.php">
            <button class="btn btn-warning pull-right"><i class="far fa-file-image"></i>  Ver archivos cargados</button></a>
        </div>
      </div>
      <hr>
      <!-- Heading -->
    <!--   <div class="">
      <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalRegisterForm">Add File</button>
    </div> -->
    <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Add File Form</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-2">
  

      </div>
   
    </div>
  </div>
</div>
<div id="loader"></div>
<!-- <div class="text-center">
  <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalRegisterForm">Launch
    Modal Register Form</a>
</div> -->
<center>
    <div class="text-center col-md-4">
      <div class="card">
        <h5 class="card-header info-color white-text text-center py-4">
          <strong>Subir documentos</strong>
        </h5>
        <div class="card-body px-lg-5 pt-0">
          <form action="fileprocess7.php" method="post" enctype="multipart/form-data">
            <!-- Campo para seleccionar el ramo -->
            
            <div class="md-form">
            Ramo:
  <select name="ramo_id" id="ramo_id" class="form-control">
    
    <option value="" selected disabled>Seleccionar ramo</option>
    <?php while($ramo = mysqli_fetch_assoc($result_ramos)): ?>
      <option value="<?= htmlspecialchars($ramo['id']); ?>"><?= htmlspecialchars($ramo['nombre_ramo']); ?></option>
    <?php endwhile; ?>
  </select>
</div>

            <label for="subject" class="">Correo:</label>
            <input type="email" name="email" value="<?php echo htmlspecialchars($email_address); ?>" required readonly>


            <br>
           
            <br>
            <input type="file" name="myfile"> <br>
            <button type="submit" class="btn btn-info btn-rounded btn-block my-4 waves-effect z-depth-0" name="save">Subir Archivo</button>
            <footer style="font-size: 11px"><b>Tipos de archivos permitidos:</b><font color="red"><i>.pdf .docx .doc .pptx .ppt .xlsx .xls .odt .jpg .png .jpeg</i></font></footer>
          </form>
        </div>
      </div>
    </div>
  </center>

    <div class="footer-copyright py-3">
    <center>

    <div class="footer-copyright py-3">
    <p>Todos los derechos reservados &copy; <?php echo date('Y');?> </p>
    </div>
    </center>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

<!-- Card -->
  <!-- /Start your project here-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>

  <script type="text/javascript" src="js/popper.min.js"></script>

  <script type="text/javascript" src="js/bootstrap.min.js"></script>

  <script type="text/javascript" src="js/mdb.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css"/>   
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/1.0.3/css/dataTables.responsive.css">
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/1.0.3/js/dataTables.responsive.js"></script>

</body>

</html>
<script type="text/javascript">
   $("#Alert").on("click", function () {
          
          // userad();
          uservalidate();
          userfile();
   
         if (uservalidate() === true && userfile() === true) {
   
         };
   
   
   });
   
   //    function userad() {
   // if ($('#orangeForm-name').val() == '') { 
   //     $('#orangeForm-name').css('border-color', '#dc3545');
   //  return false;
   //   } else {
   //    $('#orangeForm-name').css('border-color', '#28a745'); 
   //     return true;
   // }

   function uservalidate() {
   if ($('#categ').val() == '') { 
       $('#categ').css('border-color', '#dc3545');
    return false;
     } else {
      $('#categ').css('border-color', '#dc3545'); 
       return true;
   }
   
   };

      function userfile() {
   if ($('#file').val() == '') { 
       $('#file').css('border-color', '#dc3545');
    return false;
     } else {
      $('#file').css('border-color', '#dc3545'); 
       return true;
   }
   
   };
   

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