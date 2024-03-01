/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pqServlet;

import Controlador.JavaConnect;
import Modelo.Coche;
import Modelo.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServletPrecioTotal", urlPatterns = {"/ServletPrecioTotal"})
public class ServletPrecioTotal extends HttpServlet {

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
            throws ServletException, IOException, SQLException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        JavaConnect.connectdb();

        int numeroUsuario = usuario.getNumero();
        
        

        // Consulta para obtener los coches del usuario
        java.sql.Connection conexion = JavaConnect.getConnection();

        String consultaPrecioTotal = "SELECT SUM(PRECIO) AS total FROM COCHE WHERE cod_usuario = ?";
        PreparedStatement sentenciaPrecioTotal = conexion.prepareStatement(consultaPrecioTotal);
        sentenciaPrecioTotal.setInt(1, numeroUsuario);
        ResultSet rsPrecioTotal = sentenciaPrecioTotal.executeQuery();

        int preciototal = 0;
        
       
        
        if (rsPrecioTotal.next()) {
            preciototal = rsPrecioTotal.getInt("total");
        }

        System.out.println("El precio total es " +preciototal);
        
        rsPrecioTotal.close();
        sentenciaPrecioTotal.close();

        // Actualizar el precio en la tabla del usuario
        String actualizarPrecioTotal = "UPDATE USUARIO SET preciototalcoches = ? WHERE numero = ?";
        PreparedStatement sentenciaActualizar = conexion.prepareStatement(actualizarPrecioTotal);
        sentenciaActualizar.setInt(1, preciototal);
        sentenciaActualizar.setInt(2, numeroUsuario);
        sentenciaActualizar.executeUpdate();

        // Cerrar recursos
        sentenciaActualizar.close();
        conexion.close();
        
         

        // Guardar el usuario en la sesión
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", usuario);
        
        usuario.setPrecioTotalCoches(preciototal);

        response.sendRedirect("MenuPrincipal.jsp");
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletPrecioTotal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletPrecioTotal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
