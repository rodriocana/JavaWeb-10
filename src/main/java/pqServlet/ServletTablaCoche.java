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
@WebServlet(name = "ServletTablaCoche", urlPatterns = {"/ServletTablaCoche"})
public class ServletTablaCoche extends HttpServlet {

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

        // Consulta para obtener los coches del usuario
        String consultaCoches = "SELECT * FROM COCHE WHERE cod_usuario = ?";
        PreparedStatement sentenciaCoches = conexion.prepareStatement(consultaCoches);
        sentenciaCoches.setInt(1, numeroUsuario);
        ResultSet rsCoches = sentenciaCoches.executeQuery();

        // Lista para almacenar los coches del usuario
        ArrayList<Coche> cochesUsuario = new ArrayList<>();

        // Iterar sobre los resultados de la consulta de coches
        while (rsCoches.next()) {
            // Suponiendo que tienes una clase Coche con un constructor adecuado
            Coche coche = new Coche();

            coche.setCod_coche(rsCoches.getInt("cod_coche"));
            coche.setModelo(rsCoches.getString("modelo"));
            coche.setColor(rsCoches.getString("color"));
            coche.setRutaimagen(rsCoches.getString("rutaimagen"));
            coche.setPrecio(rsCoches.getInt("precio"));

            cochesUsuario.add(coche);

        }
        
        usuario.setCoches(cochesUsuario);
        
         // Guardar el usuario en la sesión
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);

            response.sendRedirect("tablaCoches.jsp");
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
            Logger.getLogger(ServletTablaCoche.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletTablaCoche.class.getName()).log(Level.SEVERE, null, ex);
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
