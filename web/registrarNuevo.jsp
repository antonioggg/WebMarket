<%-- 
    Document   : registrarNuevo
    Created on : 23/04/2014, 04:28:58 PM
    Author     : pico
--%>

<%@page import="logica.*"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Registrar Nuevo Usuario</title>
    </head>
    <body>
            <%
                buscar bu=new buscar();
                guardar gu=new guardar();
   Proveedor per=new Proveedor();
    
   String vac="";
    
                if (ServletFileUpload.isMultipartContent(request)) {
                    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                    List fileItemsList = servletFileUpload.parseRequest(request);
                    String optionalFileName = "";
                    FileItem fileItem = null;
                    Iterator it = fileItemsList.iterator();        
                    while (it.hasNext()) {
                        FileItem fileItemTemp = (FileItem) it.next();
                        if (fileItemTemp.isFormField()) {
                                      if(fileItemTemp.getFieldName().equals("menu")){
                        per.setTipo(fileItemTemp.getString());
                            }     else
                            
                                     if(fileItemTemp.getFieldName().equals("usuario")){
                            per.setNick(fileItemTemp.getString());
                            }else
                                      if(fileItemTemp.getFieldName().equals("email")){
                            per.setEmail(fileItemTemp.getString());
                            }else
                                           if(fileItemTemp.getFieldName().equals("contraseña")){
                            per.setPass(fileItemTemp.getString());
                            }else
                                                if(fileItemTemp.getFieldName().equals("nombre")){
                            per.setNombre(fileItemTemp.getString());
                            }else
                                                     if(fileItemTemp.getFieldName().equals("apellido")){
                            per.setApellido(fileItemTemp.getString());
                            }else
                                   if(fileItemTemp.getFieldName().equals("nacimiento")){
                            per.setFechanac(fileItemTemp.getString());
                            }else
                                          if(fileItemTemp.getFieldName().equals("link")){
                                   if(fileItemTemp.getFieldName().equals(vac)){per.setLink(vac);}
                                   else{
                            per.setLink(fileItemTemp.getString());}
                            }else
                                   if(fileItemTemp.getFieldName().equals("compania")){
                if(fileItemTemp.getFieldName().equals(vac)){per.setNombre_cia(vac);}
                                   else{
                            per.setNombre_cia(fileItemTemp.getString());}
                            }
                  
                        if (fileItemTemp.getFieldName().equals("filename")) {
                            optionalFileName = fileItemTemp.getString();
                        }
                    } 
                            
                        fileItem = fileItemTemp;
                }
                if (fileItem != null) {
                    String fileName = fileItem.getName();
                    per.setImagen(fileName);
                     String nombreArchivo = fileName;
                        StringTokenizer token = new StringTokenizer(nombreArchivo);
                        nombreArchivo = "";
                        while (token.hasMoreTokens()) {
                            nombreArchivo += token.nextToken();
                        }

      
// construimos un objeto file para recuperar el trayecto completo
                        File fichero = new File(fileName);
// nos quedamos solo con el nombre y descartamos el path
                        
                        fichero = new File("E:\\Escritorio\\Prog Aplic\\WebMarket\\web\\imagenes\\" + nombreArchivo); 
                    
// escribimos el fichero colgando del nuevo path
                        fileItem.write(fichero);
                  } 
                        }
                else{
                JOptionPane.showMessageDialog(null,"No es multipart");
                }
                 if(bu.existeNick(per.getNick())||bu.existeEmail(per.getE_mail())){
                      JOptionPane.showMessageDialog(null,"Datos Incorrectos");
                  }else{
                  gu.guardarProvedor(per);
                  
                  
                          
             HttpSession se=request.getSession(true);
       session.setAttribute("usuario", per.getNick());
       session.setAttribute("pass", per.getE_mail());
               }
             response.sendRedirect("index.jsp");
                
            %>
          
    </body>
</html>
