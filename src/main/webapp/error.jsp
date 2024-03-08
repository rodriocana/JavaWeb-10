<%-- 
    Document   : Error
    Created on : 27 feb 2024, 16:16:35
    Author     : Rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

               
            }
            .background{
                width: 430px;
                height: 520px;
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;
                
            }
             h1{
                text-align: center;
                margin-top: 40px;
                font-family: 'Poppins',sans-serif;
                color: #B90808;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            
              p{
                text-align: center;
                margin-top: 40px;
                font-family: 'Poppins',sans-serif;
                color: #FC1717;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            
        button{
                
    background-color: #ffffff;
    color: #B90808;
    font-size: 18px;
    font-weight: 600;
    border-radius: 10px;
    margin-top: 20px;
    padding: 10px 20px;
    border: 2px solid #080710;
    cursor: pointer;
   }
            
        </style>
    
    <title>Error</title>
</head>
<body>
    <h1>Error</h1>
    <p><%= request.getParameter("mensaje")%></p>
    
  <div style="text-align: center;">
    <button onclick="window.location.href = 'index.html';">Volver atrás</button>
</div>

</body>
</html>
