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
public class Soldado {
   
    
    public static void Agregar_Soldado(String Nombre, String Apellido, int IDCompania, String NombreCuartel ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Agregar_Soldado] (?,?,?,?)}");

        consulta.setString(1, Nombre);
        consulta.setString(2, Apellido);
        consulta.setInt(3, IDCompania);
        consulta.setString(4, NombreCuartel);
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Soldado Guardado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
    }
        public static void Modificar_Soldado(int ID, String Nombre, String Apellido, int IDCompania, 
                String NombreCuartel ){
      
        try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Actualizar_Soldado] (?,?,?,?,?)}");

        consulta.setInt(1, ID);
        consulta.setString(2, Nombre);
        consulta.setString(3, Apellido);
        consulta.setInt(4, IDCompania);
        consulta.setString(5, NombreCuartel);
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Soldado Modificado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        }
        
        
        }
        
        public static void Eliminar_Soldado(int ID){
            
             try{ 
        CallableStatement consulta = Conexion.con.prepareCall("{call [dbo].[Eliminar_Soldado] (?)}");

        consulta.setInt(1, ID);
        
        
        consulta.execute();
        
        
        JOptionPane.showMessageDialog(null,"Soldado Eliminado");
        
          } catch (SQLException ex) {

        JOptionPane.showMessageDialog(null,ex.getMessage());

        } 
            
        }
}

    

    
    

