/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

import java.sql.CallableStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Reymundo Tenorio
 */
public class Servicio {
   
    
    public static void Agregar_Servicio(String Descripcion, int IDCompania, int IDCuerpo){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Agregar_Servicio] (?,?,?)}");

        consulta.setString(1, Descripcion);
        consulta.setInt(2, IDCompania);
        consulta.setInt(3, IDCuerpo);
       
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Servicio Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Servicio(int ID, String Descripcion , int IDCompania, int IDCuerpo ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[Actualizar_Servicio] (?,?,?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Descripcion);
        consulta.setInt(3, IDCompania);
         consulta.setInt(4, IDCuerpo);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Servicio Modificado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Servicio(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call  [dbo].[Eliminar_Servicio] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Servicio Eliminado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    

