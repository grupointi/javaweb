/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Toshiba
 */
public class Datos {
    private Connection cnn;
    
    public Datos(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db="jdbc:mysql://localhost/facturacion";
            try {
                cnn = DriverManager.getConnection(db,"root","");
            } catch (SQLException ex) {
                Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            }
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
  public void cerrarConexion(){
        try { 
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
  
  }  
    
    
 
  public String validadUsuario(String usuario, String clave){
        try {
        String sql = "select idPerfil from usuarios where idUsuario='" +usuario+ "'and Clave ='"+clave+"'";
        Statement st=cnn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if(rs.next()) return rs.getString("idPerfil"); 
                else return "no ok ";
       } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return "no ok";
        }
  
  }


  public Usuario getUsuario(String idUsuario ){
        try {
            Usuario miUsuario=null;
            String sql = "select * from usuarios where idUsuario='" +idUsuario+ "'  ";
            Statement st=cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()){
                miUsuario= new Usuario
                       ( rs.getString("idUsuario"),
                         rs.getString("nombres"),
                         rs.getString("apellidos"),
                         rs.getString("clave"),
                         rs.getInt("idPerfil"),
                         rs.getString("foto")
                          );
            
            }
            return miUsuario;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
  
  }
  
  
  public void newUsuario(Usuario miUsuario ){
        try {
            String sql = "insert into usuarios values('" 
                        +miUsuario.getIdUsuario() + " ','"
                        +miUsuario.getNombres()+"','"
                        +miUsuario.getApellidos()+"','"
                        +miUsuario.getClave()+"',"
                        +miUsuario.getIdPerfil()+",'"
                        +miUsuario.getFoto()+"')";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
  
  
   public void updateUsuario(Usuario miUsuario ){
        try {
            String sql = "update usuarios set "
                    +"nombres  =  '"+miUsuario.getNombres()+"',"
                    +"apellidos  =  '"+miUsuario.getApellidos()+"',"
                    +"clave  =  '"+miUsuario.getClave()+"',"
                    +"idPerfil  ="+miUsuario.getIdPerfil()+" ,"
                    +"foto  =  '"+miUsuario.getFoto()+"' "
                    + "where idUsuario='"+miUsuario.getIdUsuario()+"' ";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
  
  
   
    public void deleteUsuario(String idUsuario ){
        try {
            String sql = "delete from usuarios  "
                     + "where idUsuario='"+idUsuario+"' ";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
  
   
   
    
     public ResultSet getUsuarios(){
        try {
          
            String sql = "select * from usuarios";
            Statement st=cnn.createStatement();
            return  st.executeQuery(sql);
           
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
  
  }
   
   
     
   public Cliente getCliente(String idCliente ){
        try {
            Cliente miCliente=null;
            String sql = "select * from clientes where idCliente='" +idCliente+ "'  ";
            Statement st=cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()){
                miCliente= new Cliente
                       ( rs.getString("idCliente"),
                         rs.getInt("idTipo"),
                         rs.getString("nombres"),
                         rs.getString("apellidos"),
                         rs.getString("direccion"),
                         rs.getString("telefono"),
                         rs.getInt("idCiudad"),
                         rs.getDate("fechaNacimiento"),
                         rs.getDate("fechaIngreso")
                          );
            
            }
            return miCliente;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
  
  }   
     
    
   
   
    public ResultSet getClientes(){
        try {
        
            String sql = "select * from clientes";
            Statement st=cnn.createStatement();
            return  st.executeQuery(sql);
           
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
  
  }
     
    
    
    
  public void newCliente(Cliente miCliente ){
        try {
            String sql = "insert into clientes values('" 
                        +miCliente.getIdCliente()+ " ',"
                        +miCliente.getIdTipo()+",'"
                        +miCliente.getNombres()+"','"
                        +miCliente.getApellidos()+"','"
                        +miCliente.getDireccion()+"','"
                        +miCliente.getTelefono()+"',"
                        +miCliente.getIdCiudad()+",'"
                        +Utilidades.formatDate(miCliente.getFechaNacimiento())+"','"
                        +Utilidades.formatDate(miCliente.getFechaIngreso())+"')";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
   }   
     
 
  
   public void updateCliente(Cliente miCliente ){
        try {
            String sql = "update clientes set "
                    +"idTipo  =  "+miCliente.getIdTipo()+","
                    +"nombres  =  '"+miCliente.getNombres()+"',"
                    +"apellidos  =  '"+miCliente.getApellidos()+"',"
                    +"direccion  =  '"+miCliente.getDireccion()+"',"
                    +"telefono  =  '"+miCliente.getTelefono()+"',"
                    +"idCiudad  ="+miCliente.getIdCiudad()+" ,"
                    +"fechaNacimiento  =  '"+Utilidades.formatDate(miCliente.getFechaNacimiento())+"', "
                    +"fechaIngreso  =  '"+Utilidades.formatDate(miCliente.getFechaIngreso())+"' "
                    + "where idCliente='"+miCliente.getIdCliente()+"' ";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
  
  
   
   public void deleteCliente(String idCliente ){
        try {
            String sql = "delete from clientes  "
                     + "where idCliente='"+idCliente+"' ";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
  
  
  
  
  
}
