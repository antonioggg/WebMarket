<%-- 
    Document   : topmenu
    Created on : 22-sep-2014, 17:45:44
    Author     : Admin
--%>

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

                    buscar bu=new buscar();
                    String clien="cliente";
            %>
        <div id="cabecera" style="float: right;">
                 <%if(usuario==null){%> 
            <div id="sesion"><a href="iniciarSesion.jsp"> Iniciar Sesion
                <img id="logsesion" src="imagenes/sesion.png" style="width: 30px;height: 30px;"></a>
            <a href="RegistroUsuario.jsp"> Registrarse
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
              <li> <% 
              //trae el tipo del usuario
                if(ctrlu.traerTipoUsuario(usuario).equals(clien)){%>
                <a href="InformacionCompras.jsp">Mis Compras</a>
                <%}%></li>
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