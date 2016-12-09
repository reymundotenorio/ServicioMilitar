package Clases;


import java.sql.*;
import javax.swing.JOptionPane;
public class Conexion {
public static Connection con,con1;
public static Statement state,state1;
public static ResultSet result,result1;

public Conexion(String url,String user,String pass)throws SQLException,ClassNotFoundException
{
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

  //  con=DriverManager.getConnection("jdbc:odbc:Driver={SQL Server};Server=TENORIOASUS\\REYMUNDOTENORIO"
   //     + "; Database=ServicioMilitar;Uid="+user+"; Pwd="+pass); //Conexion Directa
 con=DriverManager.getConnection(url,user,pass); // Conexion OBDC
    state=con.createStatement(result.TYPE_SCROLL_SENSITIVE,result.CONCUR_UPDATABLE);
    JOptionPane.showMessageDialog(null,"Conexión Establecida");

}//fin del constructor
 public static ResultSet consulta(String sql)throws SQLException{

        state1 = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,result1.CONCUR_READ_ONLY);
        result1 = state1.executeQuery(sql);//aqui hago consultas y devuelvo los resultados
        return result1;
}
}
