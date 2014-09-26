<%-- 
    Document   : controlNick
    Created on : 06/09/2014, 07:23:46 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.*" %>
<!DOCTYPE html>
<%
 String user=request.getParameter("usuario");
 CtrlUsuario ctrus=new CtrlUsuario();
 boolean si=ctrus.existenick(user);
 if(si){%>
 <%}else{%>
 <p><img src="imagenes/iconoerror.png" width="10" height="10"/>Error... Usuario Incorrecto</p>
<%}%>
