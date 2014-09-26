
package logica;

public class Productos {
    
    //Atributos
    private String nombre;
    private String provedor;
    private int numero;
    private double precio;

    public Productos(int num, String nom, double pre, String prov) {
        this.numero = num;
        this.nombre = nom;
        this.precio = pre;
        this.provedor = prov;
    }
    
    public void SetDataPro(int num, String nom, double pre, String prov) {
    numero = num;
    nombre = nom;
    precio = pre;
    provedor = prov;
    }

    public Productos() {
        this.nombre = "";
        this.provedor = "";
        this.numero= 0;
        this.precio = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProvedor() {
        return provedor;
    }

    public void setProvedor(String provedor) {
        this.provedor = provedor;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

}
