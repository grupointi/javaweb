<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Aplicacion web</title>
       
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="encabezado.jsp"></jsp:include>
        <script>
        $(document).ready(function(){
            $("#validarUsuario").submit(function(){
                 $.post("validarUsuario",$("#validarUsuario").serialize(),function(data){
                     
                   perfil= jQuery.trim(data);  
                    if(perfil=="1") document.location.href="MenuAdministrador.jsp"; 
                    else if(perfil=="2") document.location.href="MenuEmpleado.jsp";  
                    else $("#mensaje-ingreso").html("<h1>Usuario o clave no valido</h1>");
            });   
             return false;  
          });  
        
        });
        </script>
        
    </head>
    <body>
        <% 
            session.invalidate();
        %>
        <div>Ingrese al sistema</div>
        <form name="validarUsuario"  id="validarUsuario" action="validarUsuario" method="POST">
            <table border="0">
              
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="usuario" id="usuario" value="" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Clave</td>
                        <td><input type="password" name="clave"  id="clave" value="" size="10" /></td>
                    </tr>
                      <tr>
                          <td colspan="2"  ><input type="submit" id="ingresar" value="Ingresar" name="ingresar" /></td>
                   </tr>
                </tbody>
            </table>
        <div id="mensaje-ingreso"></div>
        </form>
    </body>
</html>
