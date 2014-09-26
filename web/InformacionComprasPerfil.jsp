<%-- 
    Document   : InformacionComprasPerfil
    Created on : 19/09/2014, 04:41:50 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="logica.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="javax.swing.DefaultListModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
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
      <link rel="stylesheet" type="text/css" href="css/EstiloTabla.css">
     <script type="text/javascript" src="js/jquery.js"></script> 
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
<script type="text/javascript">

$(document).ready(function() 
    { $("table").tablesorter({});
       // $("#myTable").tablesorter();
 
    }
            
       
);
</script> 
    
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
              <a class="navbar-brand" href="index.jsp">DIRECT MARKET</a>
          </div>
            
              <%
        HttpSession sesion=request.getSession(true);
        String usuario=(String)sesion.getAttribute("usuario");
        buscar bu=new buscar();
        String clien="cliente";
         ResultSet sr,rs;
         CtrlCompra ctrcom=new CtrlCompra();
        %>
        <div id="cabecera" style="float: right;">
            <div id="sesion"><p><%=usuario%> :
           <% 
           String ima=bu.traerImagenProvedor(usuario);
           %>
  <img id="logsesion" src="imagenes/<%=ima%>" width="40" height="40" />
 </p></div>
        </div>
        
          <div style="" class="navbar-collapse collapse in">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Link</a></li>
              <li><% 
        if(bu.traerTipoUsuario(usuario).equals(clien)){%>
        <a href="InformacionCompras.jsp">Mis Compras</a>
        <%}%></li>
              <li><a href="#">Link</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Acciones <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="verinfoperfil.jsp">Ver Perfil</a></li>
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
    <div id="medio">

    <%
       int numero;
  String num=request.getParameter("numcompra");
  numero=Integer.parseInt(num);  
%>
                     <table id="otraTable" class="tablesorter"> 
<thead> 
<tr> 
    <th>Nombre del Producto</th> 
    <th>Precio(UDS)</th> 
    <th>Cantidad Productos</th> 
    <th>Subtotal(UDS)</th> 

</tr> 
</thead> 
<tbody>         
         <% 
  
       sr=ctrcom.mostrarcompras(numero);
        if(sr!=null){
        while(sr.next()){
       int idp=sr.getInt("idproducto");
       Productos pro=new Productos();
       pro=bu.mostrarProductos(idp);
       String nombre=pro.getNombre();
       double pre=pro.getPrecio();
       int canti=sr.getInt("cantidad");
       double subtot=canti*pre;
       
        %>  
        <tr><td><%=nombre%></td><td><%=pre%></td>
            <td><%=canti%></td><td><%=subtot%></td>
            <td><a href="mostrarCompras.jsp?idorden=<%=numero%>">Consultar</a></td></tr>
    <%}}%>

        
</tbody> 
</table> 
        </div><%--Fin div Medio--%>
      </div>
       <div class="row">
           <!--Listar categorias -->
           <div class="col-lg-3">
               <h3>Categorias</h3>
                <ul>
               <%
               rs = ctrlc.mostrarCategoria();
                while(rs.next()){
                String nombre=rs.getString("nombre");
            %>
            <li><a href="index.jsp?mydata=<%= nombre%>"><%= nombre%></a></li>
             <% }  %> </ul>
           </div>
           <div class="col-lg-9">
               <%
                String nomcat = request.getParameter("mydata");
                String producto = null;
                ArrayList pro = new ArrayList();
                pro = ctrlp.verProductosPorCategoria(nomcat);
                
                Iterator it = pro.iterator();
                
                while (it.hasNext()) {
                    producto = (String)it.next();
                    int numprod = ctrlp.getnumprod(producto);
                    String imagen = ctrlp.getimagenprod(numprod);%>
                    <div class="col-lg-3">
                        <p><%= producto %></p>
                         <p class="text-danger"></p>
                         <p><img src="imagenes/<%= imagen%>" width="80%"  class="img-thumbnail"> </p>
                        <p><a class="btn btn-danger" href="#" role="button">Ver mas</a></p>
                    </div>
                    <%}
                   
                %>
                
         
         
        
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
