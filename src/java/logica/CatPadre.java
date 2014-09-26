package logica;

final public class CatPadre extends Categoria {
    private String nombre;
    
    public CatPadre (String nombre) {
        this.nombre = nombre;
    }
    
    public CatPadre () {
        
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

        public String toString() {
        return nombre;
    }  
}

