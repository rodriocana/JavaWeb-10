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

        <style media="screen">

            *,
            *:before,
            *:after{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body{

                background-image: url('https://wallpapercave.com/uwp/uwp4256581.webp');
                background-repeat: no-repeat;


            }
            .background{
                width: 430px;
                height: 520px;
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;

            }

            h2{
                text-align: center;
                margin-top: 40px;
                font-family: 'Poppins',sans-serif;
                color: #B90808;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            
       .button {
        display:inline-flex;
        border: 2px solid white; 
        padding: 10px 20px;
        margin-top: 30px;
        background-color: rgba(132, 204, 235, 0.9);
        color: #fff;
        
        border: 2px;
        border-radius: 10px;
        cursor: pointer;
        margin-right: 30px; /* Agregar margen derecho */
    }
    
    .button2 {
    display: inline-flex;
    padding: 10px 20px;
    border: 2px solid white; 
    margin-top: 30px;
    background-color: rgba(0, 182, 187, 0.5); /* Cambiar el valor alfa para hacerlo más transparente */
    color: #fff;
    border: 2px solid transparent; /* Agregar un borde transparente */
    border-radius: 10px;
    cursor: pointer;
    margin-right: 30px; /* Agregar margen derecho */
    backdrop-filter: blur(5px); /* Aplicar desenfoque al fondo */
}

.button2:hover {
    backdrop-filter: blur(8px); /* Aumentar el desenfoque al pasar el ratón */
}
    

    nav ul {
        text-align: center; /* Mover los botones a la derecha */
    }

    button{
        
        align-content: center;
        padding: 10px;
    }

   .button:hover {
    background-color: #0056b3;
    transform: translateY(5px);
}

.buttonLogOut {
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
    text-align: center; /* Centra el texto horizontalmente */
}
    
.usuario-table {
    width: 20%; /* Por ejemplo, puedes ajustar este valor según tus necesidades */
    margin: 0 auto; /* Esto centra la tabla horizontalmente en la página */
    border-collapse: collapse;
}

.usuario-table th, .usuario-table td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
}

.usuario-table th {
    background-color: #f2f2f2;
}
            
        </style>
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
        <!-- No se debe mostrar la contraseña en la interfaz de usuario -->
    <% } else { %>
        <p>No se han encontrado detalles del usuario.</p>
    <% } %>

    
    <a href="ServletCerrarSesion" class="buttonLogOut">Cerrar Sesión</a>
    
    <nav>
        <ul>
            <li><a href="ServletTablaCoche" class="button">Ver Coches de <%= usuario.getNombre() %> </a></li>
            <li><a href="ServletListaCoches" class="button">Lista en cajas de coches en el concesionario</a></li>  
             <li><a href="ServletPrecioTotal" class="button2">Calcular precio total</a></li>  
             
           
        </ul>
    </nav>
    
    
    </body>
</html>
