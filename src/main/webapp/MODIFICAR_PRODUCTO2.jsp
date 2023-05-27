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
            String user=request.getParameter("admin");
            String cod=request.getParameter("producto");
            
            String producto=new String(request.getParameter("nombre").getBytes("ISO-8859-1"), "UTF-8");
            String cantidad=new String(request.getParameter("cantidad").getBytes("ISO-8859-1"), "UTF-8");
            String costo=new String(request.getParameter("costo").getBytes("ISO-8859-1"), "UTF-8");
            String provedor=new String(request.getParameter("provedor").getBytes("ISO-8859-1"), "UTF-8");
            String precio=new String(request.getParameter("precio").getBytes("ISO-8859-1"), "UTF-8");
            
            
            Connection conx=null;
            Statement sta=null;
            ResultSet results=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conx=DriverManager.getConnection("jdbc:mysql://localhost/dennoun?autoReconnect=true&useSSL=false","root","n0m3l0");
                sta=conx.createStatement();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
            try{
                
                sta.executeUpdate("UPDATE productos SET nombre_producto='"+producto+"', cantidad_producto='"+cantidad+"', precio_compra='"+costo+"', precio_venta='"+precio+"', provedor='"+provedor+"' WHERE cod_producto='"+cod+"';");
                
                %>
                
               <script src="alert4.js"></script> 
               <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "PRODUCTO.jsp?admin=<%=user%>&producto=<%=cod%>"; }, 1600 );
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