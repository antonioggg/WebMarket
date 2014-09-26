
package logica;

import conexion.buscar;
import conexion.guardar;
import conexion.listar;
import java.awt.List;
import conexion.*;
import java.awt.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;



//@author Francis
 
public class CtrlProductos {
    buscar bu = new buscar();
    listar lis=new listar();
    guardar gu=new guardar(); 
    private String nopro;
    
    public ArrayList verProductosPorCategoria (String nombre){
      
      ArrayList pro = new ArrayList();
       try {
           pro = (ArrayList)bu.ProductosPorCategoria(nombre);
       } catch (SQLException ex) {
           Logger.getLogger(CtrlProductos.class.getName()).log(Level.SEVERE, null, ex);
       }
      Iterator it = pro.iterator();
       while (it.hasNext()) {
           String producto = (String)it.next();
          
       }
      return pro;
    } 

  

    public String getrefprod(String selected) {
        String prodref = bu.getprodref(selected);
        return prodref;
    }
        
    
   
 
 public void especificacioproducto(int referencia,String desc,String esp){
    gu.especificacioproducto(referencia, desc, esp);
 }
 public void guardarproducto(Productos pro){
    gu.guardarproducto(pro);
 }   
 public void guardarImagen(int referencia, String nombre){
   gu.guardarImagen(referencia, nombre);
 }
    public boolean existeNumero(int num){
        return bu.existeNumero(num);
    }
    public String getNopro() {
        return nopro;
    }
    public void setNopro(String nopro) {
        this.nopro = nopro;
    }
    
    private static CtrlProductos instance = new CtrlProductos();
    
    public static CtrlProductos getInstance(){
        return instance;
    }
     
    public Productos ListarProductos(int producto) {
        
        return bu.mostrarProductos(producto);
    }
    public ResultSet ProductosPorCategoria(int num_ref) {
        buscar bu = new buscar();
        return bu.VerCatProducto(num_ref);
    }
    public LinkedList<Productos> getProdProv(String nick){
        return lis.getProdProv(nick);
    }
    public int getnumprod(String nomprod){
         return bu.traeNumeroProd(nomprod);
    }
    public String getimagenprod(int num){
        return bu.traerimagen(num);
    }
    
    public Productos  GetProductos(int num) {
      return bu.getProducto(num);
  }
    
     public EspecificacionProd GetEspecificacionP (int num) {
      return bu.GetEspecificacionPro(num);
  }
    
     public ResultSet mostrarImagenP(int num) {
      return bu.BuscarImagenes(num);
  }
     public int traerNumpProd(String nick){
        return bu.traeNumeroProd(nick);  
     }
     public LinkedList<Productos> getListaProductos(){
        return lis.getListaProductos();
     }
}


