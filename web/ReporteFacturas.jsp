<%-- 
    Document   : ReporteFacturas
    Created on : Mar 4, 2016, 10:56:18 AM
    Author     : Toshiba
--%>

<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:include page="encabezado.jsp"></jsp:include>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Reporte de facturas</h1>
           <a href="javascript:history.back(1)">Regresar a la pagina anterior</a><br>
         <%
         
        HttpSession sesion = request.getSession();
        Usuario miUsuario=(Usuario) sesion.getAttribute("usuario");
        if(miUsuario.getIdPerfil()==1){
         %>
         <a href="MenuAdministrador.jsp">Regresar al menu</a>
          <%   }  else  {  %>
         <a href="MenuEmpleado.jsp">Regresar al menu</a>
          <%  }  %>
    
    </body>
</html>
