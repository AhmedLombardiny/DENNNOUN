<%@page  import="Clasesitas.basesita"%>
<%@page  import="java.sql.*"%>
<%@page import="java.lang.Math"%>
<%@page  import="java.sql.*"%>
<%@page  import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: black">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <title>Registro</title>
    </head>
    <body style="font-family: sans-serif; color: black; background-image:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('img/login.png');">
        <%
            basesita conexion= new basesita();
            String user=request.getParameter("admin");
            
            String producto=new String(request.getParameter("producto").getBytes("ISO-8859-1"), "UTF-8");
            String cantidad=new String(request.getParameter("cantidad").getBytes("ISO-8859-1"), "UTF-8");
            String costo=new String(request.getParameter("costo").getBytes("ISO-8859-1"), "UTF-8");
            String provedor=new String(request.getParameter("provedor").getBytes("ISO-8859-1"), "UTF-8");
            String precio=new String(request.getParameter("precio").getBytes("ISO-8859-1"), "UTF-8");
            
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            
            Random random = new Random();
            int cod = random.nextInt(1000000000)+1;
            
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
                
                sta.executeUpdate("insert into productos values('"+cod+"','"+producto+"','"+cantidad+"','"+costo+"','"+precio+"','"+provedor+"','"+timestamp+"','"+timestamp+"');");
                
                %>
                
               <script src="alert4.js"></script> 
               <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "INVENTARIO.jsp?admin=<%=user%>"; }, 1600 );
                    </script> 
                <%
                
                conx.close();
                sta.close();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
        %>
    
    </body>
</html>
