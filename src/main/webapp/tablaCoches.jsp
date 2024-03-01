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
    <style>
        .coches-section {
            margin: 20px;
        }

        body{

            background-image: url('https://wallpapercave.com/uwp/uwp4256581.webp');
            background-repeat: no-repeat;


        }

        .button{
            margin-top: 100px;
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

            .coches-table {
            width: 100%;
            border-collapse: collapse;
            }

            .coches-table th, .coches-table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
            }

            .coches-table th {
            background-color: #f2f2f2;
            }
        </style>
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
                        <th>Foto</th>

                    </tr>
                </thead>
                <tbody>

                    <% for (Coche coche : coches) { %>
                    <tr>
                        <td><%= coche.getCod_coche() %></td>
                        <td><%= coche.getColor() %></td>
                        <td><%= coche.getModelo() %></td>
                        <td><%= coche.getPrecio() + " Euros" %></td>
                        <td><img src="<%= request.getContextPath() + coche.getRutaimagen() %>" alt="Imagen del Coche" width="100"></td>
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