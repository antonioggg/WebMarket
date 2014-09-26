<%-- 
    Document   : mostrarCompras
    Created on : 09/09/2014, 05:41:54 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String compras="";
compras=request.getParameter("idorden");
        response.sendRedirect("InformacionCompras.jsp?idord="+compras);
        %>
        <h1></h1>
    </body>
</html>
