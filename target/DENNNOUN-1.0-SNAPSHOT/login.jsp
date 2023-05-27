<%@page  import="Clasesitas.basesita"%>
<%@page  import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body style="font-family: sans-serif; color: black; background-image:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('img/login.png');">
        <%
           basesita conexion=new basesita();
        String user=new String(request.getParameter("usuario").getBytes("ISO-8859-1"), "UTF-8");
        String con=new String(request.getParameter("contrasenia").getBytes("ISO-8859-1"), "UTF-8");
        
            Connection conx=null;
            Statement sta=null;
            ResultSet results=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conx=conexion.getConexion();
                sta=conx.createStatement();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
            
            try{
                results=sta.executeQuery("select*from admins where administrador='"+user+"' and contrasenia_admin='"+con+"';");
                if(results.next()){
                
                    %>
                    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
                    <script src="alert1.js"></script> 
                    
                    <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "PRINCIPAL.jsp?user=<%=user%>"; }, 1600 );
                    </script>
                    <%
                }else{
                results=sta.executeQuery("select*from admins where administrador='"+user+"' and contrasenia_admin='"+con+"';");
                if(results.next()){

                %>
                    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
                    <script src="alert1.js"></script> 
                    
                    <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "PRINCIPAL.jsp?admin=<%=user%>"; }, 1600 );
                    </script>
                    <%
                    
                }else{
                
                %>
               <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
               <script src="alert2.js"></script> 
               <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "Login.html"; }, 1500 );
                    </script> 
                <%
                    }
                }
                conx.close();
                sta.close();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
            
        %>
    </body>
</html>
