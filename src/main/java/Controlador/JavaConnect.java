package Controlador;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JavaConnect {

    private static Connection con;

    public static Connection connectdb() {

        try {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver encontrado");
        } catch (ClassNotFoundException e) {

        }

        try {
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/ConcesionarioWeb", "rodri", "admin");
            System.out.println("Conectado");
        } catch (SQLException e) {  // preguntar a tomas si puedo poner directamente MiExcepcion en este catch
           
            System.out.println("Errorr");
        }

        return con;
    }

    public static Connection getConnection() {
        return con;
    }

    public static void cerrarConexion() {
        if (con != null) {
            try {
                con.close();
                System.out.println("Conexión cerrada");
            } catch (SQLException ex) {
                int codigoError = 103;

            }
        }
    }
}
