
package logica;

import conexion.*;
import java.util.LinkedList;

//@author Francis

//Controlador de Usuario
public class CtrlUsuario {
    buscar bu=new buscar();
    guardar gu=new guardar();
    

//Verificar que no exista el nick
    public boolean existenick(String nick){
 return bu.existeNick(nick);
     }
         public boolean existePass(String pas){
 return bu.existePass(pas);
     }
    
     public boolean existemail(String mai){
 return bu.existeEmail(mai);
     }
     
    public void guardarProvedor(Proveedor pro){
    gu.guardarProvedor(pro);
    }
    
    public void guardarCliente(Cliente cli){
    gu.guardarCliente(cli);
    }

    public LinkedList<Cliente> listarUsuarios(){
        listar lis = new listar();
        LinkedList<Cliente> clientes = lis.getCliente();
        return clientes;
    }

    public LinkedList<Proveedor> listarProveedor() {
        listar lis = new listar();
        LinkedList<Proveedor> proveedores = lis.getProveedor();
        return proveedores;
        
    }
    public Cliente getcliente(String nick){   
        return bu.getcliente(nick);      
    }
    public Proveedor getProveedor(String nick){
        return bu.getproveedor(nick);
    }
    public String traerTipoUsuario(String user){
        return bu.traerTipoUsuario(user);
    }
            
}
