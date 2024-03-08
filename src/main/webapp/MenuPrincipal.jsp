<%-- 
    Document   : MenuPrincipal
    Created on : 27 feb 2024, 14:46:20
    Author     : Rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Modelo.Usuario"%>

<!DOCTYPE html>

<html>

    <head>

        <link rel="stylesheet" type="text/css" href="StyleMenuPrincipal.css">

    <h2>¡Bienvenido al concesionario, <%= session.getAttribute("nombreUsuario") %>!</h2>

    <% 
        Usuario usuario = (Usuario)session.getAttribute("usuario");
        
        if(usuario != null) {
    %>
    <table class="usuario-table">
        <tr>
            <th>Número de Usuario</th>
            <td><%= usuario.getNumero() %></td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td><%= usuario.getNombre() %></td>
        </tr>
        <tr>
            <th>Sueldo</th>
            <td><%= usuario.getSueldo() %></td>
        </tr>

        <tr>
            <th>Fecha de Alta</th>
            <td><%= usuario.getFechaalta() %></td>
        </tr>
        <tr>
            <th>Precio Total de coches </th>
            <td><%= usuario.getPrecioTotalCoches() + " Euros" %></td>
        </tr>
    </table>
    
    <% } else { %>
    <p>No se han encontrado detalles del usuario.</p>
    <% } %>


    <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>

    <nav>
        <ul>
            <a href="ServletTablaCoche" class="button">Ver Coches de <%= usuario.getNombre() %> </a>
            <a href="ServletListaCoches" class="button">Lista en cajas de coches en el concesionario</a>
            <a href="ServletPrecioTotal" class="button2">Calcular precio total</a>
        </ul>
    </nav>


</body>
</html>
