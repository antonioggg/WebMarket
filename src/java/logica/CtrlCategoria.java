
package logica;


import conexion.buscar;
import conexion.guardar;
import conexion.listar;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;


//@author Francis

public class CtrlCategoria {
    buscar bu=new buscar();
    guardar gu=new guardar();
    buscar cat= new buscar();
    buscar catprod= new buscar();
    
    
    
    
    public String categoria;

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    public CtrlCategoria(){
        this.categoria = "";
    }
    
    private static CtrlCategoria instance = new CtrlCategoria();
    
    public static CtrlCategoria getInstance(){
        return instance;
    }
    
        
    
    public ResultSet mostrarCategoria(){
       return cat.mostrarCategorias();      
    }
    
     //Verificar que no exista la categoría
    public boolean existeCat(String nombre){
        return bu.existeCat(nombre);
     }

    public ArrayList ProductosPorCategoria(String nombre) throws SQLException{
        return catprod.ProductosPorCategoria(nombre);
    }
    
    public void guardarcategoriaproducto(String cat,int referencia){
    gu.guardarcategoriaproducto(cat, referencia);
    } 

    
    public void altacategoria(String nom){

        String hija="CatHija";
        if(nom.equals(hija)){
      CatHija cat = new CatHija();
        }
          
          CatHija cat = new CatHija();
          // cat.setTipo(nom);
           guardar gc= new guardar();
           gc.altacat(nom);
     }
public boolean existeC(String nom){
        buscar cat= new buscar();
        return cat.findCat(nom);
     }

public ResultSet CatXProducto(int num) {
      return bu.traemeCategorias(num);
  }

}


    


