<%-- 
    Document   : iniciarSesion
    Created on : 16/09/2014, 12:21:56 AM
    Author     : pico
--%>
<%@page import="logica.CtrlUsuario"%>
<%@page import="logica.Productos"%>
<%@page import="logica.CtrlCategoria"%>
<%@page import="java.util.LinkedList"%>
<%@page import="conexion.listar"%>
<%@page import="javax.swing.DefaultListModel"%>
<%@page import="logica.CtrlProductos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.buscar"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.CtrlCategoria"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.ResultSet"%>
<%! String thedata, theperfil; %>
<%  
   HttpSession sesion=request.getSession(true);
   String usuario=(String)sesion.getAttribute("usuario");
    listar lis = new listar();
    CtrlProductos ctrlp = new CtrlProductos();
    CtrlCategoria ctrlc = new CtrlCategoria();
    CtrlUsuario ctrlu = new CtrlUsuario();
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

    <title>Direct Market WEB</title>

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
        <script type="text/javascript">
          $(document).ready(function(){
              $("#usuario").blur(function(){
                  usuario=$(this).val();
                  datatype='usuario='+usuario;
                 $.ajax({
              type: 'POST',
              url: "controlNick.jsp",
              data:datatype,
              success: function (data) {
                  $("#erroruser").fadeIn(1000).html(data);      
                
    }
          });  
              });
          });

           $(document).ready(function(){
              $("#contra").blur(function(){
                  pass=$(this).val();
                  datatype='pass='+pass;
                 $.ajax({
              type: 'POST',
              url: "controlPass.jsp",
              data:datatype,
              success: function (data) {
                  $("#errorpass").fadeIn(1000).html(data);      
                
    }
          });  
              });
          });

    
 
            
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
        <h1>Iniciar Sesion</h1>
      </div>
       <div class="opaca">
           <div class="row">
                <form name="iniciosesion" id="iniciosesion" action="iniciarsesion" class="form-horizontal" method="post">
                <div id="info">
                                <%String error=request.getParameter("Error");
                                if(error!=null){%>
                                <%=error%>
                               <% }%>
                                
                            </div>
                    <div class="form-group">
                    <label  class="col-sm-4 control-label">Ingrese Usuario </label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario :" required="">
                        <div id="erroruser"></div>
                    </div>
                    </div>
                    <div class="form-group">
                    <label  class="col-sm-4 control-label"> Ingrese Contraseña </label>  
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="contra" name="contra" placeholder="Contraseña :" required="">
                         <div id="errorpass">   
                    </div>
                    </div>
                    </div>
                    <div class="form-group">
                         <div class="col-sm-offset-4 col-sm-6">
                            <button id="boton" type="submit" onclick="comprobar();" class="texto"><img src="imagenes/Login.jpg" width="80" height="25">
                         </div> 
                    <div>   
                   </form>  
           </div>
        </div> 
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


