<%-- 
    Document   : MenuAdministrador
    Created on : Feb 25, 2016, 10:34:32 AM
    Author     : Toshiba
--%>

<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:include page="encabezado.jsp"></jsp:include>
         <title>Sistema de Facturacion</title>
    </head>
    <body>
        
       <% 
             HttpSession sesion= request.getSession();
             Usuario miUsuario=(Usuario) sesion.getAttribute("usuario");
             if(miUsuario==null){
       %>
       <jsp:forward page="index.jsp"></jsp:forward> 
       <%
             } 
          if (miUsuario.getIdPerfil()!=1){
       %>
       <jsp:forward page="index.jsp"></jsp:forward>>       
       <%
             }
         String foto = miUsuario.getFoto();
         if (foto.equals(null) || foto.equals("") ) foto = "usuario.jpg";  
       
       %>
       
          <h1>Menu Principal</h1>
          <h2> Bienvenido <%=miUsuario.getNombres() + " " + miUsuario.getApellidos() %> </h2>
          <img src="<%="images/"+foto%>" width="100" height="150" alt=""/>
      <br><br>
          <br><br>
          <a href="Clientes.jsp">Clientes</a><br>
          <a href="MenuAdministrador.jsp">Productos</a><br>
          <a href="Usuarios.jsp">Usuarios</a><br>
          <a href="MenuAdministrador.jsp">Nueva Factura</a><br>
          <a href="ReporteFacturas.jsp">Reporte Facturas</a><br> 
          <a href="index.jsp">Salir</a><br>  
    </body>
</html>
