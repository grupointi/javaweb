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
         if (foto == null) foto = "";  
       
       %>