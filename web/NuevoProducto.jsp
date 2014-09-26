<%-- 
    Document   : NuevoProducto
    Created on : 10/09/2014, 05:22:03 PM
    Author     : Eduardo
--%>
<%@page import="javax.swing.JOptionPane"%>
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
  </head>
  
  <!-- FUNCION PARA SOLO DEJAR ESCRIBIR NUMEROS CON DECIMALES -->
  <SCRIPT language=Javascript>
      <!--
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode;
         if ((key == 8 || key == 9 || key == 13 || (key >= 48 && key <= 57) || key == 188 || key == 110))
        {
        alert("ingrese solo numeros");
        return false;
        }
         
 
         return true;
      }
      //-->
   </SCRIPT>
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
              <a class="navbar-brand" href="index.jsp"><img src="imagenes/logowebDM2.png" width="170" height="auto"></a>
          </div>
                       <%
                    HttpSession sesion=request.getSession(true);
                    String usuario=(String)sesion.getAttribute("usuario");
                    buscar bu=new buscar();
                    String clien="cliente";
            %>
        <div id="cabecera" style="float: right;">
                 <%if(usuario==null){%> 
            <div id="sesion"><a href="iniciarSesion.jsp"> Iniciar Sesion
                <img id="logsesion" src="imagenes/sesion.png" style="width: 30px;height: 30px;"></a>
            </div> 
                 
            <div id="registro"><a href="RegistroUsuario.jsp"> Registrarse
                <img id="logsesion" src="imagenes/registro.png" style="width: 30px;height: 30px;"></a>
            </div>
            
            <%}else{%>
            <div id="sesion">
                
                <p><a href="CerrarSesion">Cerrar Sesion </a><%=usuario%> :
           <% 
           String ima=bu.traerImagenProvedor(usuario);
           %>
  <img id="logsesion" src="imagenes/<%=ima%>" width="40" height="40" />
 </p></div><%} %>
   </div>
           <div style="" class="navbar-collapse collapse in">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Link</a></li>
              <li> </li>
              <li><a href="#">Link</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="verinfoperfil.jsp">Ver Perfil</a></li>
                  <li><a href="VerInfoProducto.jsp">Ver Producto</a></li>
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
        <h1>Nuevos Productos</h1>
        <p>  <form id="form1" name="form1" method="get" action="snewprod">
    <table> 
    <li>
    <label>Nombre producto :</label><input type="text" id="nombre" name="nombre" required="">
    </li>
    <li>
    <label>Referencia producto : </label><input onkeypress="return isNumberKey(event);"  type="text" id="ref" name="ref" required="">
    </li>
    <li>
    <label>Descripcion : </label>     
    <textarea type="text" id="des" name="des" rows="3" cols = "23"required=""></textarea>
    </li>
    <li>
    <label>Especificaciones : </label><input type="text" id="esp" name="esp" required="">
    </li>
    <li>
        <label>Precio :</label><input onkeypress="return isNumberKey(event);" type="text" id="pre" name="pre" required="">
    </li>
    </table>
    <label><span>(*)</span>Categorias :</label>
    <table>   
           <%
               ResultSet sr= bu.mostrarCategorias();
               if(sr!=null){
               while(sr.next()){
                String nombre=sr.getString("nombre");
                out.write("<tr><td><input name= 't[]' id= '"+nombre+"' type= 'checkbox' value= '"+nombre+"'>"+nombre+"</td></tr>");
 } }else{JOptionPane.showMessageDialog(null,"Vacio");} %> 
         
    </table>
           </div>
           
               <%
                String nomcat = request.getParameter("mydata");
                
                ArrayList pro = new ArrayList();
                pro = ctrlp.verProductosPorCategoria(nomcat);
                Iterator it = pro.iterator();
                while (it.hasNext()) {
                    String producto = (String)it.next();%>
                    <div class="col-lg-3">
                        <h2><%= producto %></h2>
                         <p class="text-danger"></p>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn btn-primary" href="#" role="button">Comprar</a></p>
                    </div>
                    <%}%>
                    <p><input  class="btn btn-danger" type="submit" value="Guardar"  ></p>
        </form></p>
    <div class="col-lg-9">
        <p>
          <a class="btn btn-lg btn-danger" href="http://getbootstrap.com/components/#navbar" role="button">Ver Producto »</a>
        </p>
      </div>
        <div class="opaca">
       <div class="row">
       
           <!--Listar categorias -->
           <div class="col-lg-3">
               <h3>Categorias</h3>
                <ul>
               <%
               ResultSet rs = ctrlc.mostrarCategoria();
                while(rs.next()){
                String nombre=rs.getString("nombre");
            %>
            <li><a class="a.text-primary" href="index.jsp?mydata=<%= nombre%>"><%= nombre%></a></li>
             <% }  %> </ul>
           </div>
           <div class="col-lg-9">
               <%
               
                String producto = null;
              
                pro = ctrlp.verProductosPorCategoria(nomcat);
                
                
                
                while (it.hasNext()) {
                    producto = (String)it.next();
                    int numprod = ctrlp.getnumprod(producto);
                    String imagen = ctrlp.getimagenprod(numprod);%>
                    <div class="col-lg-3">
                        <p><a href="VerInfoProducto.jsp?nomprod=<%= producto %>"><%= producto %><a></p>
                         <p class="text-danger"></p>
                         <p><img src="imagenes/<%= imagen%>" width="80%"  class="img-thumbnail"> </p>
                        <p><a class="btn btn-danger" href="#" role="button">Ver mas</a></p>
                    </div>
                    <%}
                   
                %>
                
         
         
        
          </div>
        </div>
    
      </div>
    
    </div> <!-- /container -->
    <div class="footer">
        <div class="container">
         
            <p>&copy; Company 2014</p> 
 
        </div>
        
      </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  

</body></html>
