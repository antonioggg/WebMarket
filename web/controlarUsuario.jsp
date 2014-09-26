<%-- 
    Document   : controlarUsuario
    Created on : 19/09/2014, 08:09:51 PM
    Author     : pico
--%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%
            buscar bu=new buscar();
        String usuario=request.getParameter("usuario");
        String pico="Pico";
 if(bu.existeNick(usuario)){%>
 <div id="Error" style="font-weight: bolder;"><font color="red"><h4><img src="imagenes/alerta.png" width="20" height="20">Nick está en uso</h4></div>
        <% }
        else{%>
 <div id="Error" style="font-weight: bolder;"><font color="green"><h4><img src="imagenes/exito.png" width="20" height="20">Nick disponible </h4></div>
        <% }%>
