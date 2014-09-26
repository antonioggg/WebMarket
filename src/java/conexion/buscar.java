
package conexion;
import logica.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class buscar {
    
     conexion.conectar bd=new conexion.conectar();
     String sql="";
    
     //mostrar ordenes de compra
     public ResultSet mostrarOrdenesCompra(){
     bd.conectarBase();
     sql="SELECT * FROM ordencompra";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
    
     public ResultSet mostrarOrdeneEspecifica(int ord){
     bd.conectarBase();
     sql="SELECT * FROM ordencompra WHERE numero="+ord+"";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        } 
     return bd.resultado;
     }
    
     public Productos mostrarProductos(int producto){
     Productos pro=new Productos();
     bd.conectarBase();
     sql="SELECT * FROM Productos WHERE numero=" +producto;
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
        pro.setNombre(bd.resultado.getString("Nombre"));
        pro.setProvedor(bd.resultado.getString("Proveedor"));
        int nu=bd.resultado.getInt("numero");
        pro.setNumero(nu);
        double prec=bd.resultado.getDouble("precio");
        pro.setPrecio(prec);
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return pro;
     }
      
     public ResultSet VerCatProducto(int num_ref) {
     bd.conectarBase();
     sql= "SELECT idcategoria FROM categoriaproducto WHERE idproducto = "+num_ref;
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bd.resultado;
        }
    
     public int traeNumeroProd(String dato) {
     int das=0;
     bd.conectarBase();
     sql= "SELECT numero FROM Productos WHERE Nombre='"+dato+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        das=bd.resultado.getInt("numero");
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return das;
     }
    
     public ResultSet mostrarProductos(String producto){
     bd.conectarBase();
     sql="SELECT Productos.numero, Productos.Nombre, Productos.Proveedor, especificacioproducto.descripcion, especificacioproducto.especificacion FROM Productos, especificacioproducto WHERE Productos.numero=especificacioproducto.idproducto AND Productos.Nombre = '" +producto+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
        
     public ResultSet traemeCategorias(int num){
     bd.conectarBase();
     sql="SELECT * FROM categoriaproducto WHERE idproducto=" +num;
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
     
     public boolean existeNick(String nic){
     boolean si=false;
     bd.conectarBase();
     sql="SELECT * FROM usuarios WHERE nick='"+nic+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            String ni=bd.resultado.getString("nick");
            if(ni.equals(nic)){
            si=true;  }
            }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return si;
     }
     
  public boolean existePass(String pas){
      boolean si=false;
      bd.conectarBase();
      sql="SELECT * FROM usuarios   WHERE password='"+pas+"'";
        try {
            bd.resultado=bd.sentencia.executeQuery(sql);
            while(bd.resultado.next()){
               String ni=bd.resultado.getString("password");
            if(ni.equals(pas)){
            si=true;
            }
            }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
      return si;
      }
     
      
     public boolean existeEmail(String mail){
     String ni="";
     boolean si=false;
     bd.conectarBase();
     sql="SELECT * FROM usuarios WHERE email='"+mail+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            ni=bd.resultado.getString("email");
            if(ni.equals(mail)){
                si=true;  }
            }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return si;
     }
     
     
     
     //mostrar compras
     public ResultSet mostrarCompras(int com){
     bd.conectarBase();
     sql="SELECT * FROM compras WHERE idorden="+com+"";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
    
     public ArrayList<CatPadre> categoriaPadre(){
     bd.conectarBase();
     ArrayList<CatPadre> cate = new ArrayList<CatPadre>();
     sql="SELECT * FROM categoria WHERE padre=''";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
        CatPadre cat=new CatPadre();
        cat.setNombre(bd.resultado.getString("nombre")); 
        cate.add(cat);
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return cate; 
     }
       
     public ArrayList<CatHija> categoriasHijas(String pad){
     ArrayList<CatHija> categ = new ArrayList<CatHija>();
     bd.conectarBase();
     sql="SELECT * FROM categoria WHERE padre='"+pad+"'"; 
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
        CatHija cat=new CatHija();
        cat.setNombre(bd.resultado.getString("nombre"));
        categ.add(cat);
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return categ;  
     }
        
     public ResultSet mostrarProveedores(){
     String prov="proveedor";
     bd.conectarBase();
     sql = "SELECT * FROM usuarios WHERE tipo='"+prov+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }  
    
     //mostrar precio unitario
     public  Productos mostrarPrecioUnitario(String prod){
     Productos pro =new Productos();
     bd.conectarBase();
     sql="SELECT * FROM Productos WHERE numero='"+prod+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            pro.setNombre(bd.resultado.getString("Nombre"));
            pro.setPrecio(bd.resultado.getDouble("precio"));
            pro.setProvedor(bd.resultado.getString("Proveedor"));
            pro.setNumero(bd.resultado.getInt("numero"));
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return pro;
     }
     
     //Encontrar categoria
     public boolean findCat(String nom) {
     throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
     }
    
     public boolean existeNumero(int num){
     bd.conectarBase();
     boolean si=false;
     sql="SELECT * FROM Productos WHERE numero="+num+"";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
        int a=bd.resultado.getInt("numero");
        if(num==a){si=true;}
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return si;
     }
    
     //muestras los productos de una determinada categoria
     public ArrayList ProductosPorCategoria(String nombre) throws SQLException{
     bd.conectarBase();
     sql = "SELECT Productos.nombre FROM Productos, categoriaproducto WHERE categoriaproducto.idproducto = Productos.numero AND categoriaproducto.idcategoria = '" +nombre+ "'";
     ArrayList lista = new ArrayList();
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            lista.add(bd.resultado.getString("nombre")); 
        } 
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return lista;  
     }
     
     public ResultSet mostrarCategoriasP(){
     bd.conectarBase();
     int a = 1;
     sql="SELECT * FROM categorias WHERE prod='"+a+"'";
     try {
         bd.resultado=bd.sentencia.executeQuery(sql);
         } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
         }
     return bd.resultado;
     }
   
     public int BuscarCatID(String nom){
     int idcat=0;   
     bd.conectarBase();
     sql="SELECT * FROM categoria WHERE nombre= "+nom+" ";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        idcat = bd.resultado.getInt("rowid");
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return idcat;    
     }
   
     public ResultSet mostrarCategorias(){
     bd.conectarBase();
     sql="SELECT * FROM categoria Where prod =1";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
     
     public String getprodref(String selected) {
     bd.conectarBase();
     String refprod=null;
     sql="SELECT * FROM Productos where Nombre ='"+selected+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        refprod = bd.resultado.getString("numero");
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return refprod;
     }
    
     public Double getprecioxprod (String refprod){
     bd.conectarBase();
     Double precio=0.0;
     sql="SELECT precio FROM Productos WHERE numero='"+refprod+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        precio = bd.resultado.getDouble("precio");
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return precio;
     }
    
     public boolean existeCat(String nom){
     boolean si=false;
     bd.conectarBase();
     sql="SELECT * FROM categoria  WHERE nombre='"+nom+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            String ni=bd.resultado.getString("nombre");
            if(ni.equals(nom)){
                si=true;  }
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return si;
     }
    
     public int contieneProductos(String cat){
     int si=0;
     bd.conectarBase();
     sql = "SELECT * FROM categoria WHERE nombre='"+cat+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        int a= bd.resultado.getInt("prod");
        if(a==1){
            si=1;  }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     bd.desconectarBaseDeDatos();
     return si;
     }
    
     public Productos mostrarPrecioUnitario(int prod){
     Productos pro =new Productos();
     bd.conectarBase();
     sql="SELECT * FROM Productos WHERE numero="+prod+"";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            pro.setNombre(bd.resultado.getString("Nombre"));
            pro.setPrecio(bd.resultado.getDouble("precio"));
            pro.setProvedor(bd.resultado.getString("Proveedor"));
            pro.setNumero(bd.resultado.getInt("numero"));
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return pro;
     }
    
     public LinkedList<String> mostrameImagenes(int pro){
     conexion.conectar bd=new conexion.conectar();
     bd.conectarBase();
     LinkedList<String> imagen=new LinkedList();
     sql="SELECT * FROM imagenes WHERE idproducto="+pro;
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            String imag=bd.resultado.getString("imagen");
            imagen.add(imag);
        }
        } catch (SQLException ex) {
            Logger.getLogger(listar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return imagen;
     }
        
     public int traemeUltimaOrden(){
     bd.conectarBase();
     String sql2 = "SELECT max(numero) as idc From ordencompra";
     int idordencompra=0;
     try {
        bd.resultado=bd.sentencia.executeQuery(sql2);
        idordencompra = Integer.parseInt(bd.resultado.getString("idc"));
        } catch (SQLException ex) {
            Logger.getLogger(guardar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return idordencompra;
     }
         
     public String traerEmail(String nom){
     String ema="";
     bd.conectarBase();
     sql="SELECT email FROM usuarios WHERE nick='"+nom+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            ema=bd.resultado.getString("email");
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return ema;
     }

     public Cliente getcliente(String nick){
     bd.conectarBase();
     Cliente cli = new Cliente();
     sql="SELECT * FROM usuarios WHERE nick='"+nick+"'";
     try {
        ResultSet rs = bd.sentencia.executeQuery(sql);
        while(rs.next()){
            cli.setDatos(rs.getString("nick"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("fechanac"), rs.getString("imagen"), rs.getString("tipo"), rs.getString("email"));
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return cli;
     }
    
     public Proveedor getproveedor(String nick){
     bd.conectarBase();
     Proveedor prov = new Proveedor();
     sql="SELECT * FROM usuarios WHERE nick='"+nick+"'";
     try {
        ResultSet rs = bd.sentencia.executeQuery(sql);
        while(rs.next()){
            prov.setDatos(rs.getString("nick"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("fechanac"), rs.getString("imagen"), rs.getString("tipo"), rs.getString("email"),rs.getString("nomcompania"), rs.getString("linkcompania"));
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return prov;
     } 
     
     public String traerimagen(int pro){
     conexion.conectar bd=new conexion.conectar();
     bd.conectarBase();
     String imag= null;
     sql="SELECT * FROM imagenes WHERE idproducto="+pro+"";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
        imag=bd.resultado.getString("imagen");
        }
        } catch (SQLException ex) {
            Logger.getLogger(listar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return imag;
     }
     
     public String traerImagenProvedor(String dato){
     bd.conectarBase();
     String imag="";
     sql="SELECT * FROM usuarios WHERE nick='"+dato+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            imag=bd.resultado.getString("imagen");
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return imag;
     }
     
     public String traerTipoUsuario(String dato){
     bd.conectarBase();
     String tipo="";
     sql="SELECT * FROM usuarios WHERE nick='"+dato+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        while(bd.resultado.next()){
            tipo=bd.resultado.getString("tipo");
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return tipo;
     }
    
 public boolean existeNickyPass(String nic,String pass){
      boolean si=false;
      bd.conectarBase();
      sql="SELECT * FROM usuarios   WHERE nick='"+nic+"' AND password='"+pass+"'";
        try {
            bd.resultado=bd.sentencia.executeQuery(sql);
            while(bd.resultado.next()){
               String ni=bd.resultado.getString("nick");
            if(ni.equals(nic)){
            si=true;
            }
            }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
      return si;
      }
    
     public ResultSet mostrarOrdenesDeCliente(String cli){
     bd.conectarBase();
     sql="SELECT * FROM ordencompra WHERE cliente='"+cli+"'";
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
           
     public ResultSet BuscarImagenes(int num){
     bd.conectarBase();
     sql="SELECT * FROM imagenes WHERE idproducto=" +num;
     try {
        bd.resultado=bd.sentencia.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return bd.resultado;
     }
            
     public Productos getProducto(int num){
     bd.conectarBase();
     Productos pr = new Productos();
     sql="SELECT * FROM Productos WHERE numero ="+num;
     try {
        ResultSet rs = bd.sentencia.executeQuery(sql);
        while(rs.next()){
            pr.SetDataPro(rs.getInt("numero"), rs.getString("Nombre"), rs.getDouble("precio"), rs.getString("Proveedor"));
        }
        } catch (SQLException ex) {
            Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
     return pr;
     }
     
     public EspecificacionProd GetEspecificacionPro(int num) {
     bd.conectarBase();
     EspecificacionProd ep = new EspecificacionProd();
     sql = "SELECT * FROM especificacioproducto WHERE idproducto= "+num;
     try{
        ResultSet rs = bd.sentencia.executeQuery(sql);
        while (rs.next()){
            ep.SetDataEspProd(rs.getInt("idproducto"), rs.getString("descripcion"), rs.getString("especificacion"));
        }
        } catch (SQLException ex) {
           Logger.getLogger(buscar.class.getName()).log(Level.SEVERE, null, ex); 
        }
     return ep;
     }
    
}   
