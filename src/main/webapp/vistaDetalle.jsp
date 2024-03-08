<%-- 
    Document   : vistaDetalle
    Created on : 1 mar 2024, 21:26:44
    Author     : Rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelo.Coche" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalle del Coche</title>
       <link rel="stylesheet" type="text/css" href="StyleDetalle.css">
    </head>
    <body>

        <% 
             
               String cocheId = request.getParameter("id");
            
              
               if (cocheId != null && !cocheId.isEmpty()) {
                  
                   int id = Integer.parseInt(cocheId);
               
                   ArrayList<Coche> cochesTotales =  (ArrayList<Coche>) session.getAttribute("coches"); 
                
                 
                   for (Coche coche : cochesTotales) {
                       if (coche.getCod_coche() == id) {
        %>


        <h1>Detalle del Coche</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Color</th>
                <th>Modelo</th>
                <th>Precio</th>
                <th>Foto</th>
            </tr>

            <tr>
                <td><%= coche.getCod_coche() %></td>
                <td><%= coche.getColor() %></td>
                <td><%= coche.getModelo() %></td>
                <td><%= coche.getPrecio() + " Euros" %></td>
                <td><img src="<%= request.getContextPath() + coche.getRutaimagen() %>" alt="Imagen del Coche" width="100"></td>
            </tr>
            <% 
                            break; 
                        }
                    }
                }
                else {
                    
            %>
            <tr>
                <td colspan="2">Error: No se proporcionó un ID de coche válido.</td>
            </tr>
            <% } %>
        </table>

        <a href="MenuPrincipal.jsp" class="button">Volver al Menú Principal</a>
        <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>
       
       
        
    </body>
</html>