<%-- 
    Document   : controlPass
    Created on : 06/09/2014, 07:43:08 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="logica.*" %>
<!DOCTYPE html>
<%
 String pass=request.getParameter("pass");
 CtrlUsuario ctrus=new CtrlUsuario();
 boolean si=ctrus.existePass(pass);
 if(si){%>
 <%}else{%>
 <p><img src="imagenes/iconoerror.png" width="10" height="10"/>Error... Password Incorrecta</p>
<%}%>
