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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de coches en el concesionario</title>
    <style>
        .coche-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-right: 10px; /* Espacio entre las cajas */
            width: 200px; /* Ancho fijo de la caja */
            display: inline-block; /* Mostrar en línea */
        }
        .coche-info {
            font-weight: bold;
        }
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
        .buttonLogOut{

            position: fixed;
            bottom: 80px;
            left: 90%;
            transform: translate(-50%, 50%);
            width: 10%;
            background-color: rgba(240, 73, 73, 0.8);
            color: #080710;
            padding: 15px;
            font-size: 20px;
            font-weight: 600;
            border-radius: 5px;
            
            border: 2px solid black; /* Agrega un borde de 2px con color negro */
            cursor: pointer;
            text-align: center;
           

            }
    </style>
</head>
<body>
    <h1>Lista de coches en el concesionario</h1>

    <% 
        // Obtener la lista de coches de la sesión
        ArrayList<Coche> cochesTotales =  (ArrayList<Coche>) session.getAttribute("coches");  // aquí le paso la lista de coches del servlet al arraylist
        
        // Iterar sobre la lista de coches y mostrar cada uno en una caja
        for (Coche coche : cochesTotales) {
    %>
    <div class="coche-box">
        <div class="coche-info">Modelo: <%= coche.getModelo() %></div>
        <a href="vistaDetalle.jsp?id=<%= coche.getCod_coche() %>"> <!-- Enlace a la página de detalle con el ID del coche -->
            <img src="<%= request.getContextPath() + coche.getRutaimagen() %>" alt="Imagen del Coche" width="200">
        </a>
    </div>
    <% } %>

    <a href="MenuPrincipal.jsp" class="button">Volver al Menú Principal</a>
    <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>
</body>
</html>