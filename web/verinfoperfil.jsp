<%@page import="logica.Proveedor"%>
<%@page import="logica.CtrlCompra"%>
<%@page import="logica.OrdenDeCompra"%>
<%@page import="logica.Cliente"%>
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
    CtrlUsuario ctrlu = new CtrlUsuario();
    CtrlProductos ctrlp = new CtrlProductos();
    CtrlCategoria ctrlc = new CtrlCategoria();
    ArrayList Catprod = new ArrayList();
    LinkedList<OrdenDeCompra> ordenCompra = new LinkedList();
    LinkedList<Productos> prodprov = new LinkedList();
    CtrlCompra ctrlcomp = new CtrlCompra();
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

  <body>

    <div class="container">

      <!-- Static navbar -->
      <div class="navbar navbar-default" role="navigation">
       <%@ include file="topmenu.jsp" %> 
      </div>

     <div class="opaca">
       <div class="row">
           
            
            <div class="col-lg-6"><h3>Ver Informacion de Perfil</h3> </div> 
       </div>     
      <div class="row">
              <%
                
                Cliente cli= new Cliente();
                Proveedor prov = new Proveedor();
                String nombre= null;
                String apell= null;
                String email= null;
                String fechanac= null;
                String imagen= null;
                String numero=null;
                String link = null;
                String comp = null;
                String nick = usuario;
                String tipo = ctrlu.traerTipoUsuario(usuario);
                if (tipo.equals("proveedor")){
                    //mostrar proveedores
                    prov = ctrlu.getProveedor(nick);
                    nombre = prov.getNombre();
                    apell = prov.getApellido();
                    email = prov.getE_mail();
                    fechanac = prov.getFechanac();
                    imagen = prov.getImagen();
                    link = prov.getLink();
                    comp = prov.getNombre_cia();
                }else {
                    //mostrar clientes
                   
                   cli = ctrlu.getcliente(nick);
                   nombre = cli.getNombre();
                   apell = cli.getApellido();
                   email = cli.getE_mail();
                   fechanac = cli.getFechanac();
                   imagen = cli.getImagen();
                   ordenCompra = ctrlcomp.listarOrdenesCompras(nick);
                   for (int j=0;j<ordenCompra.size();j++) {
                        numero = Integer.toString(ordenCompra.get(j).getNumero());
                   }
                }
                %>
                
                <div class="col-lg-3">
                    <p>Foto de Perfil</p>
                    <p> <img src="imagenes/<%= imagen%>" alt="<%= imagen%>" width="140" height="140"> </p>
                </div>
                <div class="col-lg-8">
                    <div class="col-lg-4">
                        <p>Nick : <%= nick%></p>
                        <p>Nombre : <%= nombre%></p>
                        <p>Apellido : <%= apell%></p>
                        <p>Email : <%= email%></p>
                        <p>Fecha nac: <%= fechanac%></p>
                        <p>Tipo: <%= tipo%></p>
                        <% if (tipo.equals("proveedor")){%>
                            <p>Nombre Empresa: <%= comp%></p>
                            <p>Link Empresa : <a href="<%= link%>"><%= link%></a></p>
                        <%}%>
                    </div>        
                    <div class="col-lg-4">
                        <% if (tipo.equals("proveedor")){%>
                             <h4>Productos del Proveedor</h4>  
                            <ul>
                            <%  
                                String nomProd = null;
                                prodprov  = ctrlp.getProdProv(nick);
                                for (int j=0;j<prodprov.size(); j++){
                                    nomProd = prodprov.get(j).getNombre();   
                            %>
                                <li><%= nomProd%></li>
                            <% }%>
                                </ul>
                            <%}else {%>
                                <h4>Lista compras</h4>  
                                 <ul>
                                <%
                                    for (int j=0;j<ordenCompra.size();j++) {
                                        numero = Integer.toString(ordenCompra.get(j).getNumero());
                                %>
                                <li><a href="InformacionCompras.jsp?numcompra=<%= numero%>"><%= numero%></a></li>
                                <%}%>
                            </ul>
                            <%}%>
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

