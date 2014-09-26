<%-- 
    Document   : imagenes
    Created on : 16/09/2014, 09:16:31 PM
    Author     : Eduardo
--%>
<%@page import="java.util.LinkedList"%>
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
        <title>Dar de Alta imagen</title>
    </head>
    <body>
            <%
                    buscar bu=new buscar();
                guardar gu=new guardar();
   Proveedor per=new Proveedor();
    String prod = "";
  
    
   String vac="";
    
                if (ServletFileUpload.isMultipartContent(request)) {
                    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                    
                    List fileItemsList = servletFileUpload.parseRequest(request);
                    String optionalFileName = "";
                    
                      String ima = "";
                    
                    FileItem fileItem = null;
                    Iterator it = fileItemsList.iterator();        
                    while (it.hasNext()) {
                        FileItem fileItemTemp = (FileItem) it.next();
                        if (fileItemTemp.isFormField()) {
                                      if(fileItemTemp.getFieldName().equals("prod")){
                        prod=fileItemTemp.getString();
                            }     else
                            
                                     if(fileItemTemp.getFieldName().equals("filename")){
                           optionalFileName=fileItemTemp.getString();
                            }
                    } 
                            
                        fileItem = fileItemTemp;
                }
                if (fileItem != null) {
                    String fileName = fileItem.getName();
                    
                    int ref=Integer.parseInt(prod);
                    JOptionPane.showMessageDialog(null,ref+"  "+fileName);
                    gu.guardarImagen(ref,fileName);
                 //   per.setImagen(fileName);
                     String nombreArchivo = fileName;
                    
                        StringTokenizer token = new StringTokenizer(nombreArchivo);
                        nombreArchivo = "";
                        while (token.hasMoreTokens()) {
                            nombreArchivo += token.nextToken();
                        }

      
// construimos un objeto file para recuperar el trayecto completo
                        File fichero = new File(fileName);
// nos quedamos solo con el nombre y descartamos el path
                        
                        fichero = new File("C:\\imagenes\\" + nombreArchivo); 
                  
// escribimos el fichero colgando del nuevo path
                        fileItem.write(fichero);
                  } 
                        }
                else{
                JOptionPane.showMessageDialog(null,"No es multipart");
                }
                
                 int id= Integer.parseInt(prod);
                   JOptionPane.showMessageDialog(null, id);
                 listar li = new listar();
                 
               LinkedList<String> lista=li.listarImagen(id);
                JOptionPane.showMessageDialog(null, lista.size());
              if(lista.size()<3){  response.sendRedirect("cargarimagen.jsp?idproducto="+prod);}
              else{response.sendRedirect("index.jsp");}
           
                
            %>
          
    </body>
</html>