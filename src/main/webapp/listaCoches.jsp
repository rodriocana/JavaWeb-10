<%-- 
    Document   : listaCoches
    Created on : 1 mar 2024, 1:19:24
    Author     : Rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario" %>
<%@ page import="Modelo.Coche" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Coches</title>
        <style>
            h1 {
                text-align: center;
            }

            body{

                background-image: url('https://wallpapercave.com/uwp/uwp4256581.webp');
                background-repeat: no-repeat;


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

            .button{
                margin-top: 200px;
                width: 100%;
                background-color: rgba(132, 204, 235, 0.9);
                color: #080710;
                padding: 15px;
                font-size: 10px;
                font-weight: 600;
                border-radius: 5px;
                cursor: pointer;
            }

            .button:hover{

                background-color: #0056b3;
                transform: translateY(5px);

            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

        </style>
    </head>
    <body>
        <h1>Lista de coches en el concesionario</h1>

        <table border="1">
            <tr>
                <th>Código</th>
                <th>Modelo</th>
                <th>Color</th>
                <th>Precio</th>


            </tr>
            <% 
                // Obtener la lista de coches de la sesión
                ArrayList<Coche> cochesTotales =  (ArrayList<Coche>) session.getAttribute("coches");  // aqui le paso la lista de coches del servlet al arraylist
            
                // Iterar sobre la lista de coches y mostrar cada uno en una fila de la tabla
                for (Coche coche : cochesTotales) {
            %>
            <tr>
                <td><%= coche.getCod_coche() %></td>
                <td><%= coche.getModelo() %></td>
                <td><%= coche.getColor() %></td>
                <td><%= coche.getPrecio() + " Euros" %></td>

            </tr>
            <% } %>
        </table>

        <a href="MenuPrincipal.jsp" class="button">Volver al Menú Principal</a>
        <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>
    </body>
</html>
