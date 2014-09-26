<%-- 
    Document   : index
    Created on : 08/09/2014, 06:53:07 PM
    Author     : Eduardo
--%>

<%@page import="javax.swing.JOptionPane"%>
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
    ArrayList Catprod = new ArrayList();
    DefaultListModel listaProd = new DefaultListModel();
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
   <style>
        input.texto{
    border-radius: 15px;
}

input[type=submit]{
    border-radius: 15px;
}

    table td
    { padding: 10px;
       margin: 10px;
    }

    </style>
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">DIRECT MARKET</a>
          </div>
          <div style="" class="navbar-collapse collapse in">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
          
          
          
          <%
    String ref=request.getParameter("idproducto");
          
          %>
          
          
        <h1>Registro</h1>
         <div id="registro">
            <form name="mostrarimagen" action="imagen1.jsp" method="post" enctype="multipart/form-data">
                <table cellspacing="50" name="registrarse"> 
                 <tr><td> <input type="text" name="prod" value="<%=ref%>"></td></tr>
                <tr><td>Seleccione Imagen : <input name="myFile" type="file" id="myFile" required="required"/>         
          <img id="imgSalida" width="50" height="50" src="" /></td></tr>
          <tr><td><input type="submit" class="texto" value="Registrar Nuevo"></td></tr>
          
   </table></form>
                <form action="index.jsp">
            <input type="submit" class="texto" value="Salir"> 
            </form>
           
        </div>
 
      </div>
       <div class="row">
     <div class="footer">
        <p>&copy; Company 2014</p>
      </div>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  

</body></html>