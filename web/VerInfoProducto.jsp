
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.buscar"%>
<%@page import="logica.CtrlUsuario"%>
<%@page import="conexion.listar"%>
<%@page import="java.util.LinkedList"%>
<%@page import="javax.swing.DefaultListModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.EspecificacionProd"%>
<%@page import="logica.CtrlProductos"%>
<%@page import="logica.Productos"%>
<%@page import="logica.CtrlCategoria"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<title>Ver Informacion de Producto</title>
        
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
   
    <body>
        <div class="container">

      <!-- Static navbar -->
      <div class="navbar navbar-default" role="navigation">
        <%@ include file="topmenu.jsp" %> 
        </div><!--/.container-fluid -->
    
       <div class="opaca">
           <div class="row">
               <div class="col-lg-12">
                    <h3>Informacion de Producto</h3>
               </div>
               <div class="col-lg-6">
               
               
               <%
                String nick = request.getParameter("nomprod");
                int num = ctrlp.traerNumpProd(nick);
                
                String imagen = null;
                ResultSet rs = ctrlp.mostrarImagenP(num);
              
                while (rs.next()) {
                    imagen = rs.getString("imagen");
                %>
                <p> <img src="imagenes/<%=imagen%>" alt="<%= imagen%>" width="80%" class="img-thumbnail"> </p>
                <%
                }
                %>                
                
               <%
                Productos produc = new Productos();
                String nom = null;
                double pre = 0;
                String prov = null;
           
                produc = ctrlp.GetProductos(num);
                nom = produc.getNombre();
                pre = produc.getPrecio();
                prov = produc.getProvedor();
                
                EspecificacionProd espro = new EspecificacionProd();
                String desc = null;
                String esp = null;
                
                espro = ctrlp.GetEspecificacionP(num);
                desc = espro.getDescripcion();
                esp = espro.getEspecificacion();
                
                %>
                
               </div>
                <div class="col-lg-6">
                <p><b>Nombre:</b> <%= nom %> </p> 
                <p><b>Numero de referencia:</b> <%=num%></p>
                <p><b>Precio:</b> <%=pre + "  USD" %></p>
                <p><b>Proveedor:</b> <%=prov%></p>
                <p><b>Descripcion:</b> <%=desc%></p>
                <p><b>Especificacion:</b> <%=esp%></p>
                
                <%
                String cat = null;
                rs = ctrlc.CatXProducto(num);
                %>
                <p><b>Categorias:</b> </p>
                <% 
                while(rs.next()) {
                    cat = rs.getString("idcategoria");
                    %>
                    <div class="col-lg-6">
                    <p><li><%=cat%> </li></p>
                    </div>
                <%
                }
                %>
                </div>
    </div>
       </div>  
</div> <!-- /container -->               
 <div class="footer">
        <%@ include file="footer.jsp" %> 
      </div>               
    </body>
</html>
