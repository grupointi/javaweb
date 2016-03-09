<%-- 
    Document   : ListadoUsuarios
    Created on : Mar 3, 2016, 2:06:57 PM
    Author     : Toshiba
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <jsp:include page="encabezado.jsp"></jsp:include>
            <title>Sistema de Facturacion</title>
    </head>
    <body>
        <h1>Listado Usuarios</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Perfil</th>
                    <th>Foto</th>
                </tr>
            </thead>
            <tbody>
              <%   
               Datos misDatos = new Datos();
               ResultSet  rs = misDatos.getUsuarios();
               while (rs.next()){
              %>  
                
                <tr>
                    <td><%=rs.getString("idUsuario")%></td>
                    <td><%=rs.getString("nombres")%></td>
                    <td><%=rs.getString("apellidos")%></td>
                    <td><%=(rs.getString("idPerfil").equals("1")?"Administrador":"Empleado")%></td>
                    <td><img src="<%="images/"+rs.getString("foto")%>" width="80" height="100" alt=""/></td>
                   
              <% }
               misDatos.cerrarConexion();
               %>      
                </tr>
            </tbody>
        </table>

        <a href="javascript:history.back(1)">Regresar a la pagina anterior</a><br>
        <a href="MenuAdministrador.jsp">Regresar al menu</a>
        
    </body>
</html>
