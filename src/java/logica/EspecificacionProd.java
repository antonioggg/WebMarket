
package logica;
  
public class EspecificacionProd {
    
    //Atributos
    private String especificacion;
    private String descripcion;
    private Integer id_ref;

    
    //Funciones
     public EspecificacionProd(){
       
    }
     
      public EspecificacionProd(int num, String desc, String esp) {
         this.id_ref = num;
         this.descripcion = desc;
         this.especificacion = esp;
     }
    
     public void SetDataEspProd(int num, String desc, String esp){
        id_ref = num;
        descripcion = desc;
        especificacion = esp;
    }

    public String getEspecificacion() {
        return especificacion;
    }

    public void setEspecificacion(String especif) {
        this.especificacion = especif;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getId_ref() {
        return id_ref;
    }

    public void setId_ref(Integer id_ref) {
        this.id_ref = id_ref;
    }
}
