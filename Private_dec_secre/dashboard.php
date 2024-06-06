<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if (!isset($_SESSION["admin_user"])) {
  echo "<script>window.location.href = 'http://localhost/filemanagement/private_dec_secre/index.html';</script>";
  exit(); // Asegura que el script se detenga después de redirigir
}
require_once("include/connection.php");
// Obtén la información del usuario
$id = mysqli_real_escape_string($conn, $_SESSION['admin_user']);
$r = mysqli_query($conn, "SELECT * FROM admin_login WHERE id = '$id'") or die(mysqli_error($conn));
$row = mysqli_fetch_array($r);

// Verifica la carrera y la sede del usuario
$user_status = $row['admin_status']; // Asegúrate de que el nombre de la columna sea correcto


if ($user_status != 'Decano' && $user_status != 'Secretaria') {
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
  <style>
    .navbar {
    background-color: #dd211c !important;
  }
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
  $(document).ready(function() {
      // Para cada elemento con la clase 'toggle-sedes'
      $('.toggle-sedes').on('click', function() {
        // Encuentra el siguiente elemento 'submenu' y muestra u oculta su visibilidad
        $(this).next('.submenu').slideToggle('fast');
      });

      // Para cada elemento con la clase 'toggle-carreras'
      $('.toggle-carreras').on('click', function() {
        // Encuentra el siguiente elemento 'div' y muestra u oculta su visibilidad
        $(this).next('div').slideToggle('fast');
      });
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

          <!-- Left -->
          <ul class="navbar-nav mr-auto">
          <!--   <li class="nav-item active">
              <a class="nav-link waves-effect" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect" href="#">About
                MDB</a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect" href="#">Free
                download</a>
            </li>
            <li class="nav-item">
              <a class="nav-link waves-effect" href="#">Free
                tutorials</a>
            </li> -->
          </ul>
            <?php 

     require_once("include/connection.php");


               $id = mysqli_real_escape_string($conn,$_SESSION['admin_user']);


              $r = mysqli_query($conn,"SELECT * FROM admin_login where id = '$id'") or die (mysqli_error($con));

              $row = mysqli_fetch_array($r);

               $id=$row['admin_user'];
               // $fname=$row['fname'];
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
 <div id="loader"></div>
    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">

      <a class="logo-wrapper waves-effect">
      
        <img src="img/autonoma.png" width="124px" height="84px;" class="img-fluid" alt="">
      </a>

      <div class="list-group list-group-flush">
        <a href="dashboard.php" class="list-group-item active waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard
        </a>
         
            
        
        <div class="list-group">
    <div class="list-group-item list-group-item-action waves-effect toggle-sedes">
        <i class="fas fa-folder-open"></i> Ver archivos cargados
    </div>
    <div class="submenu" style="display: none;">
        <div class="list-group-item list-group-item-action waves-effect toggle-carreras">
            Sede Talca
        </div>
        <div  style="display: none;">
            
                
        <button onclick="window.location.href='view_userfile.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Informática
        </button>
        <button onclick="window.location.href='view_userfile2.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Industrial
        </button>
        
        </div>
        
        <div class="list-group-item list-group-item-action waves-effect toggle-carreras">
            Sede Temuco
        </div>
        <div  style="display: none;">
            
                
        <button onclick="window.location.href='view_userfile3.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Informática
        </button>
        <button onclick="window.location.href='view_userfile4.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Industrial
        </button>
            
        </div>
        
        <div class="list-group-item list-group-item-action waves-effect toggle-carreras">
            Sede Santiago
        </div>
        <div  style="display: none;">
            
                
        
        <button onclick="window.location.href='view_userfile5.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Informática
        </button>
        <button onclick="window.location.href='view_userfile6.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Industrial
        </button>
        <button onclick="window.location.href='view_userfile7.php'" class="list-group-item list-group-item-action waves-effect toggle-carreras" style="font-size: 80%;">
               > Ingeniería Civil Química 
        </button>
        
        </div>
    </div>
            
    <!--     <a href="#" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-money-bill-alt mr-3"></i>Orders</a> -->
      </div>

    </div>
    <!-- Sidebar -->

  </header>
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
              <option value="Ingeniería Civil Química">Ingeniería Civil Química</option>
              <option value="Ingeniería Civil Industrial">Ingeniería Civil Industrial</option>
            </select>
            <label data-error="X" data-success="✓" for="orangeForm-carrera">Carrera</label>
          </div>
          <div class="md-form mb-5">
            <i class="fas fa-university prefix grey-text"></i><br><br>
            <select id="orangeForm-sede" name="sede" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Sede Temuco">Sede Temuco</option>
              <option value="Sede Talca">Sede Talca</option>
              <option value="Sede Santiago">Sede Santiago</option>
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
</form>
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
              <option value="Secretaria">Secretaria(o)</option>
              <option value="Presidente">Presidente Comité</option>
              <option value="Director">Director</option>
              <option value="Decano">Decano</option>
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
              <option value="Ingeniería Civil Química">Ingeniería Civil Química</option>
              <option value="Ingeniería Civil Industrial">Ingeniería Civil Industrial</option>
            </select>
            <label data-error="X" data-success="✓" for="orangeForm-carrera">Carrera</label>
          </div>
          <div class="md-form mb-5">
            <i class="fas fa-university prefix grey-text"></i><br><br>
            <select id="orangeForm-sede" name="sede" class="form-control validate" required="" style="margin-left: 0.5rem;">
              <option value="" disabled selected></option>
              <option value="Sede Temuco">Sede Temuco</option>
              <option value="Sede Talca">Sede Talca</option>
              <option value="Sede Santiago">Sede Santiago</option>
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
</div>


<!--end modaluser-->



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
<!-- 
          <form class="d-flex justify-content-center">
       
            <input type="search" placeholder="Type your query" aria-label="Search" class="form-control">
            <button class="btn btn-primary btn-sm my-0 p" type="submit">
              <i class="fas fa-search"></i>
            </button>

          </form> -->

        </div>

      </div>
      <!-- Heading -->

      <!--Grid row-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col-md-9 mb-4">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <div class="card-body">

            <?php
require_once("include/connection.php");

$sql = "SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_files GROUP BY admin_status
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_ind_sant GROUP BY admin_status, sede
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_ind_talca GROUP BY admin_status, sede
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_ind_temuco GROUP BY admin_status, sede
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_info_sant GROUP BY admin_status, sede
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_info_talca GROUP BY admin_status, sede
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_info_temuco GROUP BY admin_status, sede
        UNION
        SELECT admin_status, sede, COUNT(admin_status) AS count FROM upload_quimi_sant GROUP BY admin_status, sede";

$result = mysqli_query($conn, $sql);
$chart_data = "";
$name = [];
$counts = [];

while ($row = mysqli_fetch_array($result)) {
    // Verificar si la tabla es upload_files para ajustar la concatenación
    if ($row['sede'] !== NULL) {
        $name[] = $row['admin_status'] . ' - ' . $row['sede'];
    } else {
        $name[] = $row['admin_status'];
    }
    $counts[] = $row['count'];
}
?>





                <CENTER><h3 class="page-header" >Número de archivos cargados por los usuarios </h3></CENTER>  
      

              <canvas id="myChart"></canvas>

            </div>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-3 mb-4">

          <!--Card-->
          <div class="card mb-4">

            <!-- Card header -->
            <div class="card-header text-center">
              Pie chart
            </div>

            <!--Card content-->
            <div class="card-body">

              <canvas id="pieChart"></canvas>

            </div>

          </div>
          <!--/.Card-->

        
    <!--Copyright-->
    <div class="footer-copyright py-3">
    <p>Todos los derechos reservados &copy; <?php echo date('Y');?> </p>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();

  </script>

  <!-- Charts -->
  <script>
    // Line
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
     data: {
            labels:<?php echo json_encode($name); ?>,
            datasets: [{
                      backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#6ae27e", "#dc69e2", "#687be2", "#e28868", "#6c68e2", "#ab68e2", "#e268b7"],
                      // hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"],
                data:<?php echo json_encode($counts); ?>,
            }]
        },
      options: {
          legend: {
            display: false
          },
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]

        }
      }
    });



    //pie
    var ctxP = document.getElementById("pieChart").getContext('2d');
    var myPieChart = new Chart(ctxP, {
      type: 'pie',
      data: {
        labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
        datasets: [{
          data: [300, 50, 100, 40, 120],
          backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
          hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
        }]
      },
      options: {
        responsive: true,
        legend: false
      }
    });



  
  </script>
  
</body>
</html>
