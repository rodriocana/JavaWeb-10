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
    
     <link rel="stylesheet" type="text/css" href="StyleCajas.css">
    
</head>
<body>
    <h1>Lista de coches en el concesionario</h1>

    <% 
        
        ArrayList<Coche> cochesTotales =  (ArrayList<Coche>) session.getAttribute("coches");  // aquí le paso la lista de coches del servlet al arraylist
        
       
        for (Coche coche : cochesTotales) {
    %>
    <div class="coche-box">
        <div class="coche-info">Modelo: <%= coche.getModelo() %></div>
        <a href="vistaDetalle.jsp?id=<%= coche.getCod_coche() %>"> 
            <img src="<%= request.getContextPath() + coche.getRutaimagen() %>" alt="Imagen del Coche" width="200">
        </a>
    </div>
    <% } %>

    <a href="MenuPrincipal.jsp" class="button">Volver al Menú Principal</a>
    <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>
</body>
</html>