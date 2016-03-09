

<%@page import="clases.Utilidades"%>
<%@page import="clases.Cliente"%>
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
             
         ////////validaciones de seguridad    
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
            String idCliente = "";
            String idTipo="";
            String nombres = "";
            String apellidos = "";
            String direccion = "";
            String telefono = "";
            String idCiudad = "";
            String fechaNacimiento = "";
            String fechaIngreso = "";

            if (request.getParameter("idCliente") != null) {
                idCliente = request.getParameter("idCliente");
            }
            if (request.getParameter("idTipo") != null) {
                idTipo = request.getParameter("idTipo");
            }
            if (request.getParameter("nombres") != null) {
                nombres = request.getParameter("nombres");
            }
            if (request.getParameter("apellidos") != null) {
                apellidos = request.getParameter("apellidos");
            }
            if (request.getParameter("direccion") != null) {
                direccion = request.getParameter("direccion");
            }
            if (request.getParameter("telefono") != null) {
                telefono = request.getParameter("telefono");
            }
            if (request.getParameter("idCiudad") != null) {
                idCiudad = request.getParameter("idCiudad");
            }
            if (request.getParameter("fechaNacimiento") != null) {
                fechaNacimiento = request.getParameter("fechaNacimiento");
            }
             if (request.getParameter("fechaIngreso") != null) {
                fechaIngreso = request.getParameter("fechaIngreso");
            }

    ///SI PRESIONA BOTON CONSULTAR
            if (consultar) {
                     Datos misDatos = new Datos();
                     Cliente miCliente = misDatos.getCliente(idCliente);
                    if ((miCliente) == null) {
                        idCliente = "";
                        idTipo = "";
                        nombres = "";
                        apellidos = "";
                        direccion = "";
                        telefono = "";
                        idCiudad = "";
                        fechaNacimiento ="";
                        fechaIngreso ="";
                        mensaje = "Cliente no exsite";
                    } else {
                        idCliente = miCliente.getIdCliente();
                        idTipo = ""+miCliente.getIdTipo();
                        nombres = miCliente.getNombres();
                        apellidos = miCliente.getApellidos();
                        direccion = miCliente.getDireccion();
                        telefono = miCliente.getTelefono();
                        idCiudad = "" + miCliente.getIdCiudad();
                        fechaNacimiento =Utilidades.formatDate(miCliente.getFechaNacimiento());
                        fechaIngreso =Utilidades.formatDate(miCliente.getFechaIngreso());
                        mensaje="Cliente consultado";
                     }
                   misDatos.cerrarConexion();
                }
            



///////////SI PRESIONA EL BOTON LIMPIAR 
     if(limpiar){
            idCliente = "";
            idTipo = "";
            nombres = "";
            apellidos = "";
            direccion = "";
            telefono = "";
            idCiudad = "";
            fechaNacimiento ="";
            fechaIngreso ="";
            mensaje = "";
     }
     /////SI PRESIONA BOTON DE NUEVO 
     if(nuevo){
            Datos misDatos=new Datos();
            Cliente miCliente=misDatos.getCliente(idCliente);
            if(miCliente!=null){
            mensaje="El Cliente ya existe!";
            }else{
                 miCliente=new Cliente(
                         idCliente,
                         new Integer(idTipo), 
                         nombres,
                         apellidos,
                         direccion, 
                         telefono,
                         new Integer(idCiudad),
                         Utilidades.stringToDate(fechaNacimiento),
                         Utilidades.stringToDate(fechaIngreso)
                         );
              misDatos.newCliente(miCliente);
              mensaje="El cliente se creo correctamente!";
            }
        misDatos.cerrarConexion();
        
     
     }
     

      /////SI PRESIONA BOTON DE MODIFICAR
     if(modificar){
            Datos misDatos=new Datos();
            Cliente miCliente=misDatos.getCliente(idCliente);
            if(miCliente==null){
            mensaje="El cliente no existe!";
            }else{
                miCliente=new Cliente(
                         idCliente,
                         new Integer(idTipo), 
                         nombres,
                         apellidos,
                         direccion, 
                         telefono,
                         new Integer(idCiudad),
                         Utilidades.stringToDate(fechaNacimiento),
                         Utilidades.stringToDate(fechaIngreso)
                         );
              misDatos.updateCliente(miCliente);
              mensaje="El cliente se modifico correctamente!";
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
        <h1>Clientes</h1>
        <form name="clientes" id="clientes" action="clientes.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Id Cliente *</td>
                        <td><input type="text" name="idCliente" id="idCliente" value="<%=idCliente%>" size="10" /></td>
                    </tr>
                      <tr>
                        <td>Tipo *</td>
                        <td><select name="idTipo"  id="idTipo">
                                <option   <%=(idTipo.equals("")?"selected='selected'":"")%>   value="0">Seleccione tipo...</option>
                                <option   <%=(idTipo.equals("1")?"selected='selected'":"")%> value="1">Cedula de ciudadania </option>
                                <option   <%=(idTipo.equals("2")?"selected='selected'":"")%>  value="2">Tarjeta de identidad</option>
                                <option   <%=(idTipo.equals("3")?"selected='selected'":"")%>  value="3">Registro Civil</option>
                                <option   <%=(idTipo.equals("4")?"selected='selected'":"")%>  value="4">Cedula extranjeria</option>
                                <option   <%=(idTipo.equals("5")?"selected='selected'":"")%>  value="5">Pasaporte</option>
                           </select>
                        </td>
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
                        <td>Direccion: </td>
                        <td><input type="text" name="direccion" id="direccion" value="<%=direccion%>" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Telefono</td>
                        <td><input type="text" name="telefono" id="telefono" value="<%=telefono%>" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Ciudad *</td>
                        <td><select name="idCiudad"  id="idCiudad">
                                <option   <%=(idCiudad.equals("")?"selected='selected'":"")%>   value="0">Seleccione ciudad...</option>
                                <option   <%=(idCiudad.equals("1")?"selected='selected'":"")%>  value="1">Medellin</option>
                                <option   <%=(idCiudad.equals("2")?"selected='selected'":"")%>  value="2">Bogota</option>
                                <option   <%=(idCiudad.equals("3")?"selected='selected'":"")%>  value="3">Cali</option>
                                <option   <%=(idCiudad.equals("4")?"selected='selected'":"")%>  value="4">Barranquilla</option>
                                <option   <%=(idCiudad.equals("5")?"selected='selected'":"")%>  value="5">Bucaramanga</option>
                                <option   <%=(idCiudad.equals("6")?"selected='selected'":"")%>  value="6">Pasto</option>
                                <option   <%=(idCiudad.equals("7")?"selected='selected'":"")%>  value="7">Cartagena</option>
                                <option   <%=(idCiudad.equals("8")?"selected='selected'":"")%>  value="8">Santa Marta</option>
                                <option   <%=(idCiudad.equals("9")?"selected='selected'":"")%>  value="9">Giron</option>
                           </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Fecha Nacimiento</td>
                         <td><input type="text" name="fechaNacimiento" id="fechaNacimiento" value="<%=fechaNacimiento%>" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Fecha Ingreso</td>
                         <td><input type="text" name="fechaIngreso" id="fechaIngreso" value="<%=fechaIngreso%>" size="20" disabled="disabled" /></td>
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
