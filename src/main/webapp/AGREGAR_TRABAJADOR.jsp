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
            
            String nombre=new String(request.getParameter("nombre").getBytes("ISO-8859-1"), "UTF-8");
            String puesto=new String(request.getParameter("puesto").getBytes("ISO-8859-1"), "UTF-8");
            String fecha=new String(request.getParameter("fecha").getBytes("ISO-8859-1"), "UTF-8");
            String salario=new String(request.getParameter("salario").getBytes("ISO-8859-1"), "UTF-8");
            String horas=new String(request.getParameter("horas").getBytes("ISO-8859-1"), "UTF-8");
            String turno=new String(request.getParameter("gridRadios").getBytes("ISO-8859-1"), "UTF-8");
            String evaluacion=new String(request.getParameter("evaluacion").getBytes("ISO-8859-1"), "UTF-8");
            
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            
            Random random = new Random();
            int cod = random.nextInt(1000000000)+1;
            
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
                
                sta.executeUpdate("insert into personal values('"+cod+"','"+nombre+"','"+puesto+"','"+fecha+"','"+salario+"','"+horas+"','"+turno+"','"+evaluacion+"');");
                
                %>
                
               <script src="alert4.js"></script> 
               <script type="text/javascript">
                       //Redireccionamiento tras 5 segundos
                       setTimeout( function() { window.location.href = "PERSONAL.jsp?admin=<%=user%>"; }, 1600 );
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
