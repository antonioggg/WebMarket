<%-- 
    Document   : controlEmail
    Created on : 19/09/2014, 08:19:19 PM
    Author     : pico
--%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <%
            buscar bu=new buscar();
        String mail=request.getParameter("email");
 if(bu.existeEmail(mail)){ %>  
 <div id="Error" style="font-weight: bolder;"><font color="red"><h4><img src="imagenes/alerta.png" width="20" height="20">Mail está en uso</h4></div>
        <% }
        else{%>
 <div id="Error" style="font-weight: bolder;"><font color="green"><h4><img src="imagenes/exito.png" width="20" height="20">Mail disponible </h4></div>
        <% }%>
     
      