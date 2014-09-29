<%-- 
    Document   : RegistroUsuario
    Created on : 18/09/2014, 11:54:47 AM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="conexion.*"%>
<%@page import="javax.swing.DefaultListModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.ResultSet"%>
<%! String thedata, theperfil; %>
<%  
    listar lis = new listar();
    CtrlProductos ctrlp = new CtrlProductos();
    CtrlCategoria ctrlc = new CtrlCategoria();
    CtrlUsuario ctrlu = new CtrlUsuario();
    ArrayList Catprod = new ArrayList();
    DefaultListModel listaProd = new DefaultListModel();
    HttpSession sesion=request.getSession(true);
   String usuario=(String)sesion.getAttribute("usuario");
    %>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">

    <title>Direct Market WEB|Iniciar Sesion</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <script language="JavaScript" type="text/javascript" src="js/jquery.js" charset="utf-8"></script>
    <script>
        $(function() {
            $( "#datepicker" ).datepicker();
        });
    </script>
        <script type="text/javascript" language="javascript">
        $(window).load(function(){

         $(function() {
          $('#myFile').change(function(e) {//necesitamos un input file para cargar el archivo y a este le asignamos al evento change un método llamado addImage() para que procese la imagen seleccionada. 
              addImage(e); 
             });

             function addImage(e){
              var file = e.target.files[0],//El método addImage() seleccionara el archivo y aplicara un filtro para que solo se pueda seleccionar imágenes.
              imageType = /image.*/;
    
              if (!file.type.match(imageType))
               return;
  
              var reader = new FileReader();
                        reader.onload = fileOnload;//Después se cargará el archivo en memoria y se asignará a un método fileOnload() el procesamiento de los datos. 
                        reader.readAsDataURL(file);
                    }

                    function fileOnload(e) {
                        var result = e.target.result;//Por último se guarda los datos de la imagen en una variable y se agregara los datos al atributo src del img. 
                        $('#imgSalida').attr("src", result);//La variable result contiene los datos de la imagen en codificación base64. 
                    }
                });//el-eche10@outlook.com
            });
            
            
        </script>
  <script type="text/javascript">
 $(document).ready(function() {	
            $('#usuario').keyup(function(){
                usuario=$(this).val();
            var dataString = 'usuario='+usuario;
             
        $.ajax({   
                 type: "POST",
                url: "controlarUsuario.jsp",
                 data: dataString,
                 success: function(data) {
                                     $('#Info').fadeIn(1000).html(data);
                                     //alert(data);
                     }
                });
         });
        });
        
	
           function comprobaruser(){
                usuario=document.getElementById("usuario").value;
            var dataString = 'usuario='+usuario;
             
        $.ajax({   
                 type: "POST",
                url: "controlarUsuario.jsp",
                 data: dataString,
                 success: function(data) {
                                     $('#Info').fadeIn(1000).html(data);
                                     //alert(data);
                     }
                });
         };
     

</script>      
 <script type="text/javascript">
 $(document).ready(function() {	
            $('#email').keyup(function(){
                email=$(this).val();
            var dataString = 'email='+email;
             
        $.ajax({   
                 type: "POST",
                url: "controlEmail.jsp",
                 data: dataString,
                 success: function(data) {
                                     $('#InfoMail').fadeIn(1000).html(data);
                                     //alert(data);
                     }
                });
         });
        });
        
      function comprobarmail(){
                email=document.getElementById("email").value;
            var dataString = 'email='+email;
             
        $.ajax({   
                 type: "POST",
                url: "controlEmail.jsp",
                 data: dataString,
                 success: function(data) {
                                     $('#InfoMail').fadeIn(1000).html(data);
                                     //alert(data);
                     }
                });
         };   

</script>         



<script type="text/javascript">
     $(document).ready(function() {	
            $('#pass').keyup(function(){
                email=$(this).val();
              if(rebisar(email)!=1){
        } }); 
        });
    
    
              function rebisar(texto){
              buscar=/[·:.ºª!|$€~%&()=?¿''Ç]/;
            if(buscar.test(texto)) {
                alert("Ilegal caracteres en contraseña \n \nºª!|·$€~%&()=?¿''Ç");
                caja=document.getElementById("pass");
               caja.innerHTML=""; 
               document.getElementById("pass").value="";
               return 1;
            }}

</script>
<script type="text/javascript">
function comprobar(){
    var una=document.getElementById("pass").value;
    var otra=document.getElementById("otrapass").value;
    borrar=document.getElementById("otrapass");
    if(una!=otra){  
        alert("Las contraseñas son diferentes");
       document.getElementById("otrapass").value="";
       document.getElementById("otrapass").focus(); 
    }

}   

</script>

<script type="text/javascript">
    function repasar(){
        tex=document.getElementById("pass").value;
        if(tex==""){
            alert("La contraseña no puede ser vacía");
            document.getElementById("pass").focus();
        }
    }
    </script>
    
    <script type="text/javascript">
     window.onload=function cambiar() {
      document.getElementById("linke").style.display='none';
      document.getElementById("linke1").style.display='none';
      document.mostrarimagen.reset(); 
      
}
function cambiarDisplay() {
   var seleccion=document.getElementById("menu"); 
   elegido=seleccion.selectedIndex;
  if(elegido==1){
      document.getElementById("linke").style.display='';
      document.getElementById("linke1").style.display='';
  }
}
    </script>
   
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <div class="navbar navbar-default" role="navigation">
            <%@ include file="topmenu.jsp" %> 
      </div>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
          
          <h1>Registro</h1>
      </div>  
          
          <div class="opaca">
           <div class="row"> 
          
        
            <form name="mostrarimagen" action="registrarNuevo.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class="form-group">     
                    <label  class="col-sm-4 control-label">Ingrese Nick : </label>
                    <div class="col-sm-8">
                        <input type="text" name="usuario" id="usuario" placeholder="Nick :" required="required" class="texto" onblur="comprobaruser();">
                        <div id="Info" style="float: right"></div>
                    </div> 
                </div> 
                 <div class="form-group"> 
                     <label  class="col-sm-4 control-label">Ingrese Email :</label>
                     <div class="col-sm-6">
                        <input type="text" name="email" id="email" placeholder="Correo Electronico :" required="required" class="texto" onblur="comprobarmail();" onkeyup="rebisar();">
                        <div id="InfoMail" style="float: right"></div>
                     </div>
                 </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Ingrese Contraseña : </label>
                <div class="col-sm-6">
                    <input type="password" name="pass" id="pass" placeholder="Contraseña :" onblur="repasar();" required="required" class="texto">
                    <div id="masInfo" style="float: right"></div>
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Repita la Contraseña anterior :</label>
                <div class="col-sm-6">
                    <input type="password" name="otrapass" id="otrapass" placeholder="Repetir Contraseña :" onblur="comprobar();" required="required" class="texto">
                    <div id="otraInfo" style="float: right"></div>
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Seleccione una opción :</label>
                <div class="col-sm-6">
                    <select name="menu" id="menu"  onchange="cambiarDisplay();">
                    <option selected="selected" value="cliente">Cliente</option>
                    <option value="proveedor">Proveedor</option>
                    </select>
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Ingrese Nombre : </label>
                <div class="col-sm-6">
                        <input type="text" name="nombre" placeholder="Nombre :" required="required" class="texto">
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Ingrese Apellido :</label>
                <div class="col-sm-6">
                    <input type="text" name="apellido" placeholder="Apellido :" required="required" class="texto">
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Ingrese Fecha Nacimiento : </label>
                <div class="col-sm-6">
                    <input type="text" name="nacimiento" required="required">
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label">Ingrese Compania :</label>
                <div class="col-sm-6">
                    <input type="text" name="compania" class="texto">
                </div>
            </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label" >Ingrese Link Web :</label>
                <div class="col-sm-6">
                    <input type="text" name="link" class="texto">
                </div>
            </div>
             <div class="form-group"> 
                 <label  class="col-sm-4 control-label">Seleccione Imagen :</label>
                 <div class="col-sm-6">
                    <input name="myFile" type="file" id="myFile" class="btn btn-primary" required="required"/>
                    <img id="imgSalida" width="50" height="50" src="" />
                 </div>
             </div>
            <div class="form-group"> 
                <label  class="col-sm-4 control-label"></label>
                <div class="col-sm-6">  
                    <input type="submit" class="btn btn-primary" value="Aceptar">
                </div>
            </div>
            </form>
           

 
      </div>
    </div> 
    </div> <!-- /container -->
    <div class="footer">
         <%@ include file="footer.jsp" %> 
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  

</body></html>

