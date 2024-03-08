<%-- 
    Document   : listaCoches
    Created on : 29 feb 2024, 16:32:08
    Author     : Rodri
--%>

<%@ page import="Modelo.Usuario" %>
<%@ page import="Modelo.Coche" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    
        <link rel="stylesheet" type="text/css" href="StyleTablas.css">

</head>



<body>
    <h2>Lista de Coches de <%= session.getAttribute("nombreUsuario") %></h2>

    <% 
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
            ArrayList<Coche> coches = usuario.getCoches();
            if (coches != null && !coches.isEmpty()) {
    %>
    <section class="coches-section">
        <table class="coches-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Color</th>
                    <th>Modelo</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>

                <% for (Coche coche : coches) { %>
                <tr>
                    <td><%= coche.getCod_coche() %></td>
                    <td><%= coche.getColor() %></td>
                    <td><%= coche.getModelo() %></td>
                    <td><%= coche.getPrecio() + " Euros" %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </section>
    <%      
        } else { 
    %>
    <p>No hay coches asociados a este usuario.</p>
    <%      
        }
    } else { 
    %>
    <p>No se han encontrado detalles del usuario.</p>
    <% 
        } 
    %>

    <a href="MenuPrincipal.jsp" class="button">Volver al Menú Principal</a>
    <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>
</body>
</html>