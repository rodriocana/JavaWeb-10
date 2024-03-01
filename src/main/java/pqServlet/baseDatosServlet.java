/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pqServlet;

import Controlador.JavaConnect;
import Modelo.Coche;
import Modelo.Usuario;
import jakarta.jms.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rodri
 */
@WebServlet(name = "baseDatosServlet", urlPatterns = {"/baseDatosServlet"})
public class baseDatosServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet baseDatosServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Prueba " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String nombre = request.getParameter("NombreUsuario");
            String password = request.getParameter("passwordUsuario");

            // Suponiendo que JavaConnect es la clase que maneja la conexión a la base de datos
            JavaConnect.connectdb();

            String consulta = "SELECT * FROM usuario WHERE nombre = ? AND password = ?";
            java.sql.Connection conexion = JavaConnect.getConnection();
            PreparedStatement sentencia = conexion.prepareStatement(consulta);
            sentencia.setString(1, nombre);
            sentencia.setString(2, password);
            ResultSet rs = sentencia.executeQuery();

            if (rs.next()) {
                // si existe el usuario y contraseña, crea una sesion
                int numeroUsuario = rs.getInt("Numero");
                int sueldo = rs.getInt("sueldo");
                String rutaImagen = rs.getString("ruta_imagen");
                String fechaAlta = rs.getString("fechaalta");
                int precioTotalCoches = rs.getInt("preciototalcoches");

                Usuario usuario = new Usuario(numeroUsuario, nombre, sueldo, rutaImagen, fechaAlta, precioTotalCoches);

                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);

                sesion.setAttribute("nombreUsuario", nombre); // Guardar el nombre de usuario en la sesión
                response.sendRedirect("MenuPrincipal.jsp"); // esta linea redirige a una pagina a parte
            } else {

                response.sendRedirect("error.jsp?mensaje=Credenciales incorrectas");  // esta linea redirige a la pantalla ERROR enviandole un texto.

            }

        } catch (SQLException ex) {
            Logger.getLogger(baseDatosServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("error.jsp"); // Redirigir a una página de error en caso de excepción
        }

        JavaConnect.cerrarConexion();

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
