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
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Rodri
 */
@WebServlet(name = "ServletListaCoches", urlPatterns = {"/ServletListaCoches"})
public class ServletListaCoches extends HttpServlet {

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
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        JavaConnect.connectdb();

        int numeroUsuario = usuario.getNumero();

        // Consulta para obtener los coches del usuario
        String consultaCoches = "SELECT * FROM COCHE";

        java.sql.Connection conexion = JavaConnect.getConnection();

        try {
            // Crear un Statement para ejecutar la consulta
            Statement statement = conexion.createStatement();

            // Ejecutar la consulta y obtener el conjunto de resultados (ResultSet)
            ResultSet rsCoches = statement.executeQuery(consultaCoches);
            // Lista para almacenar los coches del usuario
            ArrayList<Coche> cochesTotales = new ArrayList<>();  // este arraylist lo lleno de datos y se lo paso luego como atributo a la clase listacoches.jsp

// Iterar sobre los resultados de la consulta de coches
            while (rsCoches.next()) {
                Coche coche = new Coche();
                coche.setCod_coche(rsCoches.getInt("cod_coche"));
                coche.setModelo(rsCoches.getString("modelo"));
                coche.setColor(rsCoches.getString("color"));
                coche.setPrecio(rsCoches.getInt("precio"));
                coche.setRutaimagen(rsCoches.getString("rutaimagen"));
                cochesTotales.add(coche);
            }

            // Almacenar la lista de coches en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("coches", cochesTotales);  // este atributo se lo paso a listaCoches.jsp

            response.sendRedirect("listaCoches.jsp");
        } catch (Exception e) {

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
        processRequest(request, response);
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
        processRequest(request, response);
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
