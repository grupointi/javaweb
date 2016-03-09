
package clases;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Toshiba
 */
public class Utilidades {
    
  public static String formatDate(Date fecha){ 
      if(fecha==null){
         fecha =new Date();
         }

  SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/MM/dd");
    return formatoDelTexto.format(fecha);

}
  
  
 public static Date stringToDate(String fecha){
   SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/MM/dd");
   Date aux = null;
   try{
      aux = formatoDelTexto.parse(fecha);
   }catch(Exception ex){
   
   }
   return  aux;
 } 
    
    
    
    
    
    
}
