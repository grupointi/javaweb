<%-- 
    Document   : Usuarios
    Created on : Feb 26, 2016, 3:52:23 PM
    Author     : Toshiba
--%>

<%@page import="clases.Usuario"%>
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
            
         <% 
             HttpSession sesion= request.getSession();
             Usuario miUsuarioLogueado=(Usuario) sesion.getAttribute("usuario");
             if(miUsuarioLogueado==null){
         %>
            <jsp:forward page="index.jsp"></jsp:forward> 
         <%   } 
              if (miUsuarioLogueado.getIdPerfil()!=1){
         %> 
             <jsp:forward page="index.jsp"></jsp:forward>     
         <%  }
         %>   
            
            
        <%
            ////variable para mostras lo msj del sistema    
            String mensaje = "";
            ///identificamos el boton que el usuario presiono
            boolean consultar = false;
            boolean nuevo = false;
            boolean modificar = false;
            boolean borrar = false;
            boolean limpiar = false;
            boolean listar = false;

            if (request.getParameter("consultar") != null) {
                consultar = true;
            }
            if (request.getParameter("nuevo") != null) {
                nuevo = true;
            }
            if (request.getParameter("modificar") != null) {
                modificar = true;
            }
            if (request.getParameter("borrar") != null) {
                borrar = true;
            }
            if (request.getParameter("limpiar") != null) {
                limpiar = true;
            }
            if (request.getParameter("listar") != null) {
                listar = true;
            }

    ///obtenemos el valor como fue llamado el form
            String idUsuario = "";
            String nombres = "";
            String apellidos = "";
            String clave = "";
            String confirmacion = "";
            String idPerfil = "";
            String foto = "";

            if (request.getParameter("idUsuario") != null) {
                idUsuario = request.getParameter("idUsuario");
            }
            if (request.getParameter("nombres") != null) {
                nombres = request.getParameter("nombres");
            }
            if (request.getParameter("apellidos") != null) {
                apellidos = request.getParameter("apellidos");
            }
            if (request.getParameter("clave") != null) {
                clave = request.getParameter("clave");
            }
            if (request.getParameter("confirmacion") != null) {
                confirmacion = request.getParameter("confirmacion");
            }
            if (request.getParameter("idPerfil") != null) {
                idPerfil = request.getParameter("idPerfil");
            }
            if (request.getParameter("foto") != null) {
                foto = request.getParameter("foto");
            }

    ///SI PRESIONA BOTON CONSULTAR
            if (consultar) {
                    Datos misDatos = new Datos();
                    Usuario miUsuario = misDatos.getUsuario(idUsuario);
                    if ((miUsuario) == null) {
                        mensaje = "Usuario no exsite";
                        idUsuario = "";
                        nombres ="";
                        apellidos = "";
                        clave = "";
                        confirmacion = "";
                        idPerfil = "";
                        foto = "";
                    } else {
                        idUsuario = miUsuario.getIdUsuario();
                        nombres = miUsuario.getNombres();
                        apellidos = miUsuario.getApellidos();
                        clave = miUsuario.getClave();
                        confirmacion = miUsuario.getClave();
                        idPerfil = "" + miUsuario.getIdPerfil();
                        foto = miUsuario.getFoto();
                        mensaje="Usuario consultado";
                     }
                   misDatos.cerrarConexion();
                
            }



///////////SI PRESIONA EL BOTON LIMPIAR 
     if(limpiar){
          idUsuario = "";
          nombres = "";
          apellidos = "";
          clave = "";
          confirmacion = "";
          idPerfil = "";
          foto = "";
          mensaje = "";
     }
     /////SI PRESIONA BOTON DE NUEVO 
     if(nuevo){
          Datos misDatos=new Datos();
            Usuario miUsuario=misDatos.getUsuario(idUsuario);
            if(miUsuario!=null){
            mensaje="El usuario ya existe!";
            }else{
                 miUsuario=new Usuario(idUsuario,
                         nombres, 
                         apellidos,
                         clave, 
                         new Integer(idPerfil), 
                         foto);
              misDatos.newUsuario(miUsuario);
              mensaje="El usuario se creo correctamente!";
            }
        misDatos.cerrarConexion();
        
     
     }
     

      /////SI PRESIONA BOTON DE MODIFICAR
     if(modificar){
            Datos misDatos=new Datos();
            Usuario miUsuario=misDatos.getUsuario(idUsuario);
            if(miUsuario==null){
            mensaje="El usuario no existe!";
            }else{
                 miUsuario=new Usuario(idUsuario,
                         nombres, 
                         apellidos,
                         clave, 
                         new Integer(idPerfil), 
                         foto);
              misDatos.updateUsuario(miUsuario);
              mensaje="El usuario se modifico correctamente!";
            }
        misDatos.cerrarConexion();
        
     
     }



    //////////if presiona listar
    if(listar){
       %>
      <jsp:forward page="ListadoUsuarios.jsp" />
        <%
        }


        %>
        <h1>Usuarios</h1>
        <form name="usuarios" id="usuarios" action="Usuarios.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Id Usuario *</td>
                        <td><input type="text" name="idUsuario" id="idUsuario" value="<%=idUsuario%>" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Nombres *</td>
                        <td><input type="text" name="nombres" id="nombres" value="<%=nombres%>" size="30" /></td>
                    </tr>
                    <tr>
                        <td>Apellidos *</td>
                        <td><input type="text" name="apellidos" id="apellidos" value="<%=apellidos%>" size="30" /></td>
                    </tr>
                    <tr>
                        <td>Clave *</td>
                        <td><input type="password" name="clave" id="clave" value="<%=clave%>" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Confirmacion de clave *</td>
                        <td><input type="password" name="confirmacion" id="confirmacion" value="<%=confirmacion%>" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Perfil *</td>
                        <td><select name="idPerfil"  id="idPerfil">
                                <option <%=(idPerfil.equals("")?"selected='selected'":"")%>   value="0">Seleccione perfil...</option>
                                <option  <%=(idPerfil.equals("1")?"selected='selected'":"")%> value="1">Administrador</option>
                                <option   <%=(idPerfil.equals("2")?"selected='selected'":"")%>  value="2">Empleado</option>
                           </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Foto</td>
                        <td><input type="file" name="foto"  id="foto" value="<%=foto%>" />
                          <% 
                           if (foto == null) foto = "";  
                           if( !foto.equals("")) {  %>
                           <br>
                           <img src="<%="images/"+foto%>" width="100" height="150" alt=""/>
                          <%
                           }
                          %>
                        </td>
                       

                    </tr>
                     <tr colspan="2">
                        <td> * Campos Obligatorios</td>
                   </tr>
                </tbody>
           
            </table>
                   
            <br>
            <jsp:include page="Botones.jsp"></jsp:include>
            </form>
            <br>
            <h1><%=mensaje%></h1>
        <a href="javascript:history.back(1)">Regresar a la pagina anterior</a><br>
        <a href="MenuAdministrador.jsp">Regresar al menu</a>
    </body>
</html>
