<?php

 require_once("include/connection.php");

$id = mysqli_real_escape_string($conn,$_GET['ID']);


mysqli_query($conn,"DELETE FROM upload_quimi_sant WHERE ID='$id'")or die(mysql_error());
echo "<script type='text/javascript'>alert('Documento Borrado!');document.location='add_document.php'</script>";
?>
