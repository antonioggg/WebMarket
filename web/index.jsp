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
   HttpSession sesion=request.getSession(true);
   String usuario=(String)sesion.getAttribute("usuario");
   
    CtrlProductos ctrlp = new CtrlProductos();
    CtrlCategoria ctrlc = new CtrlCategoria();
    CtrlUsuario ctrlu = new CtrlUsuario();
    ArrayList Catprod = new ArrayList();
    
                    int control=7;
                int j=1;
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

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Nuevos Productos</h1>
        <p>Aqui se colocaria informacion sobre los nuevos productos.</p>
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
                String nomcat = request.getParameter("mydata");
                String producto = null;
                String nav = request.getParameter("nav");
                String back = request.getParameter("back");
             
                if (nomcat == null){
                   
                    if (nav!=null){
                        int pag = Integer.parseInt(nav);
                        j= pag;
                        control = pag+6;
                        if (control>ctrlp.getListaProductos().size()){
                           control = ctrlp.getListaProductos().size();
                    }
                      if (back!=null){
                        int pagb = Integer.parseInt(nav);
                        j= pagb-6;
                        control = pagb;
                       
                    }
                }
                for(int i=j; i< control; i++){
                        producto = ctrlp.getListaProductos().get(i).getNombre();
                        int numprod = ctrlp.getnumprod(producto);
                        String imagen = ctrlp.getimagenprod(numprod);
                      
               %>
                        
                        <div class="col-lg-4">
                        <p><a href="VerInfoProducto.jsp?nomprod=<%= producto %>"><%= producto %><a></p>
                         <p class="text-danger"></p>
                         <p><img src="imagenes/<%= imagen%>" width="140px"  height="140px"> </p>
                        <p><a class="btn btn-danger" href="#" role="button">Ver mas</a></p>
                    </div>
                        <%  }
                }
                
              
                ArrayList pro = new ArrayList();
                pro = ctrlp.verProductosPorCategoria(nomcat);
                
                Iterator it = pro.iterator();
                
                while (it.hasNext()) {
                    producto = (String)it.next();
                    int numprod = ctrlp.getnumprod(producto);
                    String imagen = ctrlp.getimagenprod(numprod);%>
                  
                    <div class="col-lg-4">
                        <p><a href="VerInfoProducto.jsp?nomprod=<%= producto %>"><%= producto %><a></p>
                         <p class="text-danger"></p>
                         <p><img src="imagenes/<%= imagen%>" width="140px"  height="140px"> </p>
                        <p><a class="btn btn-danger" href="#" role="button">Ver mas</a></p>
                    </div>
                   
                    <%}
                   
                %>
                <div class="col-lg-9">
                      <p><a class="" href="index.jsp?back=<%= j%>" role="button"><< Atras |</a><a class="" href="index.jsp?nav=<%= control%>" role="button"> Siguiente >></a></p>
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

