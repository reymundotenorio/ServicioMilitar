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
public class Compania {
   
    
    public static void Agregar_Compania(String Actividades ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Agregar_Compania] (?)}");

        consulta.setString(1, Actividades);
       
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Compañia Guardada");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Compania(int ID, String Actividades ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Actualizar_Compania] (?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Actividades);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Compañia Modificada");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Compania(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Eliminar_Compania] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Compañia Eliminada");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    

