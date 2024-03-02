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
        <style>
           
          .button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        .button:hover{

            background-color: #0056b3;
            transform: translateY(5px);

        }

        .buttonLogOut{

            position: fixed;
            bottom: 80px;
            left: 50%;
            transform: translate(-50%, 50%);
            width: 10%;
            background-color: rgba(240, 73, 73, 0.8);
            color: #080710;
            padding: 15px;
            font-size: 10px;
            font-weight: 600;
            border-radius: 5px;
            border: 2px solid white; /* Agrega un borde de 2px con color negro */
            cursor: pointer;
            text-align: center;


        }
            
        </style>
    </head>
    <body>

        <% 
               // Obtener el ID del coche a traves de parametro
               String cocheId = request.getParameter("id");
            
               // Verificar si el ID existe
               if (cocheId != null && !cocheId.isEmpty()) {
                   // Convertir el ID del coche a un entero
                   int id = Integer.parseInt(cocheId);
                
                   // Obtener la lista de coches de la sesión
                   ArrayList<Coche> cochesTotales =  (ArrayList<Coche>) session.getAttribute("coches"); 
                
                   // Buscar el coche con el ID dado
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
                            break; // Salir del bucle una vez que se ha encontrado el coche
                        }
                    }
                }
                else {
                    // Si no se proporciona un ID de coche válido, mostrar un mensaje de error
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