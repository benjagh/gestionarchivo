<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if (!isset($_SESSION["admin_user"])) {
  echo "<script>window.location.href = 'localhost/filemanagement/info_talca/login.html';</script>";
  exit(); // Asegura que el script se detenga después de redirigir
}
require_once("include/connection.php");
// Obtén la información del usuario
$id = mysqli_real_escape_string($conn, $_SESSION['admin_user']);
$r = mysqli_query($conn, "SELECT * FROM admin_login WHERE id = '$id'") or die(mysqli_error($conn));
$row = mysqli_fetch_array($r);

// Verifica la carrera y la sede del usuario
$carrera = $row['carrera']; // Asegúrate de que el nombre de la columna sea correcto
$sede = $row['sede']; // Asegúrate de que el nombre de la columna sea correcto

if ($carrera != 'Ingeniería Civil Informática' || $sede != 'Sede Talca') {
    // El usuario no tiene permisos para acceder
    echo "<script>alert('No tienes permisos para acceder a esta página.');";
    echo "window.history.back();</script>";
    exit();
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
  <link href="css/style.min.css" rel="stylesheet">

    <script src="js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="medias/css/dataTable.css" />
    <script src="medias/js/jquery.dataTables.js" type="text/javascript"></script>
    <!-- end table-->
    <script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
      $('#dtable').dataTable({
                "aLengthMenu": [[5, 10, 15, 25, 50, 100 , -1], [5, 10, 15, 25, 50, 100, "All"]],
                "iDisplayLength": 10
            });
  })
    </script>

  <style>
     /* Estilos para el texto del navbar */
  .navbar,
  .navbar .nav-link {
    color: #fff !important; /* Cambio a color blanco */
  }
     #login {
    background-color: #dc3545 !important;
    }
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
    select[multiple], select[size] {
    height: auto;
    width: 20px;
}
.pull-right {
    float: right;
    margin: 2px !important;
}

    .map-container{
overflow:hidden;
padding-bottom:56.25%;
position:relative;
height:0;
}
.map-container iframe{
left:0;
top:0;
height:100%;
width:100%;
position:absolute;
}

input[type=file] {
    border: 2px dotted #999;
    border-radius: 10px;
    margin-left: 9px;
    width: 231px!important;
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

}
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

<body class="grey lighten-3">

  <!--Main Navigation-->
  <header>

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
      <div class="container-fluid">

        <!-- Brand -->
        <a class="navbar-brand waves-effect" href="#">
          <strong class="blue-text"></strong>
        </a>

        <!-- Collapse -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

          <ul class="navbar-nav mr-auto">
          </ul>
              <?php 

             require_once("include/connection.php");


               $id = mysqli_real_escape_string($conn,$_SESSION['admin_user']);


              $r = mysqli_query($conn,"SELECT * FROM admin_login where id = '$id'") or die (mysqli_error($con));

              $row = mysqli_fetch_array($r);

               $id=$row['admin_user'];
               $admin_status=$row['admin_status'];
                $name=$row['name'];
               // $lname=$row['lname'];

            ?>

          <!-- Right -->
          <ul class="navbar-nav nav-flex-icons">
                  <li style="margin-top: 10px;">Bienvenido!,</font> <?php echo ucwords(htmlentities($id)); ?></li>
            <li class="nav-item">
              <a href="" class="nav-link waves-effect" target="_blank">
              </a>
            </li>
            <li class="nav-item">
            </li>
            <li class="nav-item">
              <a href="logout.php" class="nav-link border border-light rounded waves-effect">
               <i class="far fa-user-circle"></i>Cerrar sesión
              </a>
            </li>
          </ul>

        </div>

      </div>
    </nav>
    <!-- Navbar -->

    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">

      <a class="logo-wrapper waves-effect">
      
        <img src="img/autonoma.png" width="124px" height="84px;" class="img-fluid" alt="">
      </a>

         <div class="list-group list-group-flush">
        <a href="dashboard.php" class="list-group-item active waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard</a>
        <a href="#" class="list-group-item list-group-item-action waves-effect" data-toggle="modal" data-target="#modalAgregarRamo">
          <i class="fas fa-book mr-3"></i>Agregar ramo</a>
        <a href="#" class="list-group-item list-group-item-action waves-effect"  data-toggle="modal" data-target="#modalRegisterForm">
          <i class="fas fa-user mr-3"></i>Agregar administradores</a>
        <a href="view_admin.php" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-users"></i> Ver administradores</a>
        <a href="#" class="list-group-item list-group-item-action waves-effect" data-toggle="modal" data-target="#modalRegisterForm2">
          <i class="fas fa-user mr-3"></i>Agregar usuarios</a>
        <a href="view_user.php" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-users"></i>  Ver usuarios</a>
        <a href="add_document.php" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-file-medical"></i> Agregar documentos</a>
        <a href="#" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-folder-open"></i>Ver archivos cargados</a>
        <a href="admin_log.php" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chalkboard-teacher"></i> Admin logs</a>
        <a href="user_log.php" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chalkboard-teacher"></i> Usuarios logs</a>
    <!--     <a href="#" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-money-bill-alt mr-3"></i>Orders</a> -->
      </div>
    </div>
    
    <div class="modal fade" id="modalAgregarRamo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form action="ramo.php" method="POST">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <div style="text-align: center;">
                        <button id="btnAgregar" class="btn btn-primary">Agregar Ramo</button>
                        <button id="btnVer" class="btn btn-secondary">Ver Detalles del Ramo</button>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3" id="agregarRamoView">
                    <!-- Campos para el ramo y código de ramo -->
                    <div class="md-form mb-4">
                        <i class="fas fa-book prefix grey-text"></i>
                        <input type="text" id="nombreRamo" name="nombreRamo" class="form-control validate" required="">
                        <label data-error="X" data-success="✓" for="nombreRamo">Nombre del Ramo</label>
                    </div>
                    <div class="md-form mb-4">
                        <i class="fas fa-key prefix grey-text"></i>
                        <input type="text" id="codigoRamo" name="codigoRamo" class="form-control validate" required="">
                        <label data-error="X" data-success="✓" for="codigoRamo">Código del Ramo</label>
                    </div>
                    <div class="md-form mb-4">
                        <select class="browser-default custom-select" id="periodoRamo" name="periodoRamo" required>
                            <option value="" disabled selected>Elegir periodo</option>
                            <option value="otoño">Otoño</option>
                            <option value="primavera">Primavera</option>
                        </select>
                    </div>
                    <div class="md-form mb-4">
                        <select class="browser-default custom-select" id="añoRamo" name="añoRamo" required>
                            <option value="" disabled selected>Elegir año</option>
                            <?php
                            $currentYear = date("Y");
                            for ($year = 2000; $year <= $currentYear; $year++) {
                                echo "<option value=\"$year\">$year</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="md-form mb-4">
                        <select class="browser-default custom-select" id="nivelRamo" name="nivelRamo" required>
                            <option value="" disabled selected>Elegir nivel</option>
                            <?php
                            for ($nivel = 1; $nivel <= 11; $nivel++) {
                                echo "<option value=\"$nivel\">$nivel</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="md-form mb-4">
                        <select class="browser-default custom-select" id="sedeRamo" name="sedeRamo" required>
                            <option value="" disabled selected>Elegir sede</option>
                            <option value="Sede Talca">Sede Talca</option>
                        </select>
                    </div>
                    <div class="md-form mb-4">
                        <select class="browser-default custom-select" id="carreraRamo" name="carreraRamo" required>
                            <option value="" disabled selected>Elegir carrera</option>
                            <option value="Ingeniería Civil Informática">Ingeniería Civil Informática</option>
                            <!-- Agrega más opciones según tus necesidades -->
                        </select>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-info" name="agregarRamo">Agregar</button>
                    </div>
                
      


                    
                </div>
          <div class="modal-body mx-3" id="verRamoView" style="display: none;">
        <!-- Formulario para editar los detalles del ramo -->
       <!-- Formulario para editar los detalles del ramo -->
       <?php
require_once("include/connection.php");

// Obtener las sedes y carreras disponibles
$sedes = ["Sede Talca"];
$carreras = ["Ingeniería Civil Informática"];

// Filtrar por sede y carrera seleccionadas
$sedeSeleccionada = isset($_GET['sede']) ? $_GET['sede'] : null;
$carreraSeleccionada = isset($_GET['carrera']) ? $_GET['carrera'] : null;

$query = "SELECT * FROM ramos";
if ($sedeSeleccionada && $carreraSeleccionada) {
    $query .= " WHERE sede='$sedeSeleccionada' AND carrera='$carreraSeleccionada'";
}

$result = mysqli_query($conn, $query);

// Botones de filtrar
echo "<div class='mb-3'>";
echo "<label for='sedeSeleccionada'><strong>Seleccionar Sede:</strong></label>";
echo "<select id='sedeSeleccionada' name='sedeRamoEditar' class='browser-default custom-select'>";
echo "<option value='' disabled selected>Seleccionar Sede</option>";
foreach ($sedes as $sede) {
    echo "<option value='$sede'>$sede</option>";
}
echo "</select>";
echo "</div>";

echo "<div class='mb-3'>";
echo "<label for='carreraSeleccionada'><strong>Seleccionar Carrera:</strong></label>";
echo "<select id='carreraSeleccionada' name='carreraRamoEditar' class='browser-default custom-select'>";
echo "<option value='' disabled selected>Seleccionar Carrera</option>";
foreach ($carreras as $carrera) {
    echo "<option value='$carrera'>$carrera</option>";
}
echo "</select>";
echo "</div>";

// Botón de filtrar
echo "<button type='button' id='filtrarBtn' class='btn btn-primary'>Filtrar</button>";

$count = 0; // Inicializar la variable $count

// Mostrar formularios filtrados
while ($row = mysqli_fetch_assoc($result)) {
    echo "<div class='ramo-form-container' data-form-index='$count' style='display: none;'>";
    echo "<form action='ramo.php' method='POST' class='mb-3'>";
    // Campos comunes
    echo "<div class='mb-3'>";
    echo "<label for='nombreRamoEditarNuevo'><strong>Nombre del Ramo:</strong></label>";
    echo "<input type='hidden' name='nombreRamoEditar' value='".$row['nombre_ramo']."'>";
    echo "<input type='text' name='nombreRamoEditarNuevo' value='".$row['nombre_ramo']."' class='form-control'>";
    echo "</div>";

    echo "<div class='mb-3'>";
    echo "<label for='codigoRamoEditar'><strong>Código del Ramo:</strong></label>";
    echo "<input type='text' name='codigoRamoEditar' value='".$row['codigo_ramo']."' class='form-control'>";
    echo "</div>";

     // Campos dinámicos
     $camposDinamicos = ['año', 'nivel', 'periodo', 'sede', 'carrera'];

     foreach ($camposDinamicos as $campo) {
        echo "<div class='mb-3'>";
        echo "<label for='{$campo}Seleccionado'><strong>".ucwords($campo).":</strong></label>";
        echo "<input id='{$campo}Seleccionado' type='text' name='{$campo}RamoEditar' value='".$row[$campo]."' class='form-control' placeholder='".$row[$campo]."' readonly>";
        echo "<select name='{$campo}RamoEditar' class='browser-default custom-select' style='display:none'>";
        
        switch ($campo) {
            case 'año':
                $currentYear = date('Y');
                for ($i = 2000; $i <= $currentYear; $i++) {
                    echo "<option value='$i' ".($row[$campo] == $i ? 'selected' : '').">$i</option>";
                }
                break;
            case 'nivel':
                for ($i = 1; $i <= 11; $i++) {
                    echo "<option value='$i' ".($row[$campo] == $i ? 'selected' : '').">$i</option>";
                }
                break;
            case 'periodo':
                echo "<option value='otoño' ".($row[$campo] == 'otoño' ? 'selected' : '').">Otoño</option>";
                echo "<option value='primavera' ".($row[$campo] == 'primavera' ? 'selected' : '').">Primavera</option>";
                break;
            case 'sede':
                foreach ($sedes as $sede) {
                    echo "<option value='$sede' ".($row[$campo] == $sede ? 'selected' : '').">$sede</option>";
                }
                break;
            case 'carrera':
                foreach ($carreras as $carrera) {
                    echo "<option value='$carrera' ".($row[$campo] == $carrera ? 'selected' : '').">$carrera</option>";
                }
                break;
        }

        echo "</select>";
        echo "<button type='button' class='btn btn-sm btn-primary editar' onclick='activarEdicionCampo(this, \"$campo\")'>Editar ".ucwords($campo)."</button>";
        echo "<button type='button' class='btn btn-sm btn-secondary cancelar-edit' onclick='cancelarEdicionCampo(this, \"$campo\")' style='display:none'>Cancelar Edición</button>";
        echo "</div>";
    }

    echo "<button type='submit' class='btn btn-sm btn-success' name='guardarEdicion'>Guardar</button>";
    echo "<button type='submit' class='btn btn-sm btn-danger' name='eliminarRamo'>Eliminar</button><hr>";
    echo "</form>";
    echo "</div>";

    $count++;
}
?>


    </div>


               
            </div>
        </div>
    </form>
</div>

      <!--Add admin-->
      <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <form action="create_Admin.php" method="POST">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-user-plus"></i> Agregar Administrador</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
           <div class="md-form mb-5">
        </div>
        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="orangeForm-name" name="name" class="form-control validate" required="">
          <label data-error="X" data-success="✓" for="orangeForm-name">Nombre</label>
        </div>
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="email" id="orangeForm-email" name="admin_user" class="form-control validate" required="">
          <label data-error="X" data-success="✓" for="orangeForm-email">Correo</label>
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <input type="password" id="orangeForm-pass" name="admin_password" class="form-control validate" required="">
          <label data-error="X" data-success="✓" for="orangeForm-pass">Contraseña</label>
        </div>

        <div class="md-form mb-5">
            <i class="fas fa-university prefix grey-text"></i><br><br>
            <select id="orangeForm-carrera" name="carrera" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Ingeniería Civil Informática">Ingeniería Civil Informática</option>
            </select>
            <label data-error="X" data-success="✓" for="orangeForm-carrera">Carrera</label>
          </div>
          <div class="md-form mb-5">
            <i class="fas fa-university prefix grey-text"></i><br><br>
            <select id="orangeForm-sede" name="sede" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Sede Talca">Sede Talca</option>
            </select>
            <label data-error="X" data-success="✓" for="orangeForm-sede">Sede</label>
          </div>

        <div class="md-form mb-4">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="orangeForm-pass" name="admin_status" value = "Admin" class="form-control validate" readonly="">
          <label data-error="X" data-success="✓" for="orangeForm-pass">Tipo de usuario</label>
        </div>


      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-info" name="reg">Agregar</button>
      </div>
    </div>
  </div>
</div>

<script>

function updateSedeOptions() {
        var carreraSelect = document.getElementById("orangeForm-carrera");
        var sedeSelect = document.getElementById("orangeForm-sede");

        // Obtener el valor seleccionado de la carrera
        var selectedCarrera = carreraSelect.options[carreraSelect.selectedIndex].value;

        // Limpiar las opciones actuales de la sede
        sedeSelect.innerHTML = '<option value="" disabled selected></option>';

        // Añadir la opción de "Sede Talca" solo si la carrera seleccionada es "Ingeniería Civil Química"
        if (selectedCarrera === "Ingeniería Civil Química") {
            sedeSelect.innerHTML += '<option value="Sede Talca">Sede Talca</option>';
        } else {
            // Añadir las opciones para las otras carreras
            sedeSelect.innerHTML += '<option value="Sede Talca">Sede Talca</option>';
        }
    }
    
  document.addEventListener("DOMContentLoaded", function () {
    // Obtener elementos del DOM
    var tipoUsuarioSelect = document.getElementById("orangeForm-tipo");
    var carreraSection = document.getElementById("orangeForm-carrera").closest(".md-form");
    var sedeSection = document.getElementById("orangeForm-sede").closest(".md-form");

    // Ocultar secciones al cargar la página
    carreraSection.style.display = "none";
    sedeSection.style.display = "none";

    // Agregar un evento de cambio al campo "Tipo de Usuario"
    tipoUsuarioSelect.addEventListener("change", function () {
      // Obtener el valor seleccionado
      var tipoUsuario = tipoUsuarioSelect.value;

      // Mostrar u ocultar las secciones según el valor seleccionado
      if (tipoUsuario === "Admin") {
        carreraSection.style.display = "block";
        sedeSection.style.display = "block";
      } else {
        carreraSection.style.display = "none";
        sedeSection.style.display = "none";
      }
    });
  });
</script>
<!--end modaladmin-->
  <!--Add user-->
  <div class="modal fade" id="modalRegisterForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <form action="create_user.php" method="POST" enctype="multipart/form-data" onsubmit="return validarFormulario();">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h4 class="modal-title w-100 font-weight-bold"><i class="fas fa-user-plus"></i> Agregar usuario</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body mx-3">
          <div class="md-form mb-5">
            <i class="fas fa-user prefix grey-text"></i>
            <input type="text" id="orangeForm-name" name="name" class="form-control validate" required="">
            <label data-error="X" data-success="✓" for="orangeForm-name">Nombre</label>
          </div>
          
          <div class="md-form mb-5">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="email" id="orangeForm-email" name="email_address" class="form-control validate" required="">
            <label data-error="X" data-success="✓" for="orangeForm-email">Correo</label>
          </div>

          <div class="md-form mb-4">
            <i class="fas fa-lock prefix grey-text"></i>
            <input type="password" id="orangeForm-pass" name="user_password" class="form-control validate" required="">
            <label data-error="X" data-success="✓" for="orangeForm-pass">Contraseña</label>
          </div>

          <div class="md-form mb-4">
            <i class="fas fa-user prefix grey-text"></i><br><br>
            <label data-error="X" data-success="✓" for="orangeForm-user_status">Tipo de usuario</label>
            <select id="orangeForm-user_status" name="user_status" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Profesor">Profesor(a)</option>
              <option value="Presidente">Presidente Comité</option>
              <option value="Secretario(a) de Estudios">Secretario(a) de Estudios</option>
            </select>           
          </div>

          <div class="md-form mb-5">
            <i class="fas fa-calendar-alt prefix grey-text"></i>
            <input type="date" id="orangeForm-date" name="fecha_de_nacimiento" class="form-control validate" required="">
            <label data-error="X" data-success="✓" for="orangeForm-date">Fecha de Nacimiento</label>
          </div>

          <div class="md-form mb-5">
            <i class="fas fa-id-card prefix grey-text"></i>
            <input type="text" id="orangeForm-rut" name="rut" class="form-control validate" required="">
            <label data-error="X" data-success="✓" for="orangeForm-rut">RUT</label>
          </div>

          <div class="md-form mb-5">
            <i class="fas fa-university prefix grey-text"></i><br><br>
            <select id="orangeForm-carrera" name="carrera" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Ingeniería Civil Informática">Ingeniería Civil Informática</option>
            </select>
            <label data-error="X" data-success="✓" for="orangeForm-carrera">Carrera</label>
          </div>

          <div class="md-form mb-5">
            <i class="fas fa-university prefix grey-text"></i><br><br>
            <select id="orangeForm-sede" name="sede" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Sede Talca">Sede Talca</option>
            </select>
            <label data-error="X" data-success="✓" for="orangeForm-sede">Sede</label>
          </div>

          <div class="md-form mb-5">
            <i class="fas fa-image prefix grey-text"></i>
            <input type="file" id="orangeForm-foto" name="foto_de_perfil" class="form-control-file" required="">
            <label data-error="X" data-success="✓" for="orangeForm-foto"></label>
          </div>
        </div>
        <div class="modal-footer d-flex justify-content-center">
          <button class="btn btn-info" name="reguser">Agregar</button>
        </div>
      </div>
    </div>
  </form>
</div>

<script>

function updateSede() {
      var carreraSelect = document.getElementById("carrera");
      var sedeSelect = document.getElementById("sede");

      // Obtener el valor seleccionado de la carrera
      var selectedCarrera = carreraSelect.options[carreraSelect.selectedIndex].value;

      // Limpiar las opciones actuales de la sede
      sedeSelect.innerHTML = '<option value="" disabled selected></option>';

      // Añadir la opción de "Sede Talca" solo si la carrera seleccionada es "Ingeniería Civil Química"
      if (selectedCarrera === "Ingeniería Civil Química") {
          sedeSelect.innerHTML += '<option value="Sede Talca">Sede Talca</option>';
      } else {
          // Añadir las opciones para las otras carreras
          sedeSelect.innerHTML += '<option value="Sede Talca">Sede Talca</option>';
      }
  }

  function validarRut(rut) {
    var rutRegex = /^(\d{1,2}\.\d{3}\.\d{3}-[\dkK])|(\d{8}-[\dkK])$/;

    if (!rut.match(rutRegex)) {
      return false; // El RUT no cumple con el formato
    }

    var rutPartes = rut.split('-');
    var rutNumero = rutPartes[0].replace(/\./g, '');
    var rutVerificador = rutPartes[1];

    var suma = 0;
    var multiplo = 2;

    for (var i = rutNumero.length - 1; i >= 0; i--) {
      suma += parseInt(rutNumero.charAt(i)) * multiplo;
      multiplo = multiplo === 7 ? 2 : multiplo + 1;
    }

    var resultado = suma % 11 === 0 ? 0 : 11 - (suma % 11);
    var verificador = rutVerificador.toLowerCase() === 'k' ? 10 : parseInt(rutVerificador);

    return resultado === verificador;
  }

  function validarFormulario() {
    var rutInput = document.getElementById("orangeForm-rut");
    var rut = rutInput.value;

    if (!validarRut(rut)) {
      alert("El RUT ingresado no es válido.");
      return false;
    }

    return true;
  }
</script>

<!--end modaluser-->
</form>
  </header>
  <!--Main Navigation-->
 <div id="loader"></div>
  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">

      <!-- Heading -->
      <div class="card mb-4 wow fadeIn">

        <!--Card content-->
        <div class="card-body d-sm-flex justify-content-between">

          <h4 class="mb-2 mb-sm-0 pt-1">
            <a href="dashboard.php">Inicio</a>
            <span>/</span>
            <span>Dashboard</span>
          </h4>

          <div class="d-flex justify-content-center pull-right">
       
            <a href="add_document.php">
            <button class="btn btn-warning"><i class="far fa-file-image"></i>  Ver Archivo</button></a>
        </div>
      </div>
      <hr>
    <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Agregar archivo</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-2">
      </div>
    </div>
  </div>
</div>

 <center>
 <div class="text-center col-md-5">
<div class="card">
<h5 class="card-header info-color white-text text-center py-4">
  <strong>Cargar archivo</strong>
  </h5>
  <div class="card-body px-lg-5 pt-0">

    <div class="container">
      <div class="row"><br><br>
        <form action="fileprocess.php" method="post" enctype="multipart/form-data" >
          <div class="col-md-11">
              <div class="md-form mb-0">
                <input type="hidden" name= "email" value="<?php echo ucwords(htmlentities($name)); ?>" class="form-control" readonly="">
                <input type="text"  value="<?php echo ucwords(htmlentities($admin_status)); ?>" class="form-control" readonly="">
              </div>
            </div>
           <label for="subject" class="">Subir archivo</label>
          <input type="file" name="myfile"> <br>
          <button  type="submit" class="btn btn-info btn-rounded btn-block my-4 waves-effect z-depth-0"  name="save" type="submit">SUBIR</button>
         <footer style="font-size: 12px"><b>Tipo de archivos:</b><font color="red"><i>.pdf .docx .doc .pptx .ppt .xlsx .xls .odt .jpg .png .jpeg</i></font></footer>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Material form login -->
   <Br><br>
</div></div>
 </center>
        
    <!--Copyright-->
    <hr></div>
    <div class="footer-copyright py-3">
    <center>
      <p>Todos los derechos reservados&copy; <?php echo date('Y');?> </p>
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
   
</script>

<script>
    document.getElementById('btnAgregar').addEventListener('click', function() {
        document.getElementById('agregarRamoView').style.display = 'block';
        document.getElementById('verRamoView').style.display = 'none';
    });

    document.getElementById('btnVer').addEventListener('click', function() {
        document.getElementById('verRamoView').style.display = 'block';
        document.getElementById('agregarRamoView').style.display = 'none';
    });
</script>

<script>
    document.getElementById('btnVer').addEventListener('click', function () {
        var codigoRamo = document.getElementById('codigoRamo').value;

        $.ajax({
            url: 'obtener_detalles_ramo.php',
            type: 'GET',
            data: { codigo_ramo: codigoRamo },
            success: function(response) {
                var detallesRamo = JSON.parse(response);

                document.getElementById('nombreRamoVer').innerText = detallesRamo.nombre_Ramo;
                document.getElementById('codigoRamoVer').innerText = detallesRamo.codigo_ramo;
                document.getElementById('periodoRamoVer').innerText = detallesRamo.periodo;
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    // AJAX para obtener detalles del ramo con sede y carrera
    document.getElementById('btnVer').addEventListener('click', function () {
        var sedeSeleccionada = document.getElementById('sedeSeleccionada').value;
        var carreraSeleccionada = document.getElementById('carreraSeleccionada').value;
        var codigoRamo = document.getElementById('codigoRamo').value;

        $.ajax({
            url: 'obtener_detalles_ramo.php',
            type: 'GET',
            data: { codigo_ramo: codigoRamo, sede: sedeSeleccionada, carrera: carreraSeleccionada },
            success: function (response) {
                var detallesRamo = JSON.parse(response);

                document.getElementById('nombreRamoVer').innerText = detallesRamo.nombre_Ramo;
                document.getElementById('codigoRamoVer').innerText = detallesRamo.codigo_ramo;
                document.getElementById('periodoRamoVer').innerText = detallesRamo.periodo;
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
</script>

<script>
    $(document).ready(function() {
        // Ocultar todos los formularios al cargar la página
        $('.ramo-form-container').hide();

        // Manejar el evento del botón de filtrar
        $('#filtrarBtn').on('click', function() {
            var sedeSeleccionada = $('#sedeSeleccionada').val();
            var carreraSeleccionada = $('#carreraSeleccionada').val();

            // Mostrar solo los formularios que cumplen con la selección
            $('.ramo-form-container').each(function() {
                var formSede = $(this).find('[name="sedeRamoEditar"]').val();
                var formCarrera = $(this).find('[name="carreraRamoEditar"]').val();

                if ((sedeSeleccionada === '' || sedeSeleccionada === formSede) &&
                    (carreraSeleccionada === '' || carreraSeleccionada === formCarrera)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });

    // Scripts adicionales relacionados con la manipulación del DOM
    function activarEdicionCampo(button, campo) {
        var divCampo = button.parentNode.querySelector('#' + campo + 'Seleccionado');
        var selectCampo = button.parentNode.querySelector('select[name=' + campo + 'RamoEditar]');
        var cancelarEdicionBtn = button.parentNode.querySelector('.cancelar-edit');

        divCampo.style.display = 'none';
        selectCampo.style.display = 'block';
        cancelarEdicionBtn.style.display = 'inline-block';
        button.style.display = 'none';
    }

    function cancelarEdicionCampo(button, campo) {
        var divCampo = button.parentNode.querySelector('#' + campo + 'Seleccionado');
        var selectCampo = button.parentNode.querySelector('select[name=' + campo + 'RamoEditar]');
        var cancelarEdicionBtn = button.parentNode.querySelector('.cancelar-edit');
        var editarBtn = button.parentNode.querySelector('.editar');

        divCampo.style.display = 'block';
        selectCampo.style.display = 'none';
        cancelarEdicionBtn.style.display = 'none';
        editarBtn.style.display = 'inline-block';
    }
</script>