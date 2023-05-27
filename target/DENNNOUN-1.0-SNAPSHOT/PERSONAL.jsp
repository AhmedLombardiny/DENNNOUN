<%-- 
    Document   : PRINCIPAL
    Created on : 8 may. 2023, 02:06:55
    Author     : Ulises
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page  import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Dennoun</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <%
        
            String user=request.getParameter("admin");
        
        %>

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="#" class="navbar-brand mx-4 mb-3">
                   <img style="width: 200px" src="img/logo.png" alt="" >
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.png" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%=user%></h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>PERSONAL</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="PERSONAL_CONSULTAR.jsp?admin=<%=user%>" class="dropdown-item">CONSULTAR</a>
                            <a href="#" class="dropdown-item">AGREGAR</a>
                        </div>
                    </div>
                    <a href="PRINCIPAL_GESTION_RECURSOS.jsp?admin=<%=user%>" class="nav-item nav-link"><i class="fa fa-table me-2"></i>REGRESAR</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                
                <div class="navbar-nav align-items-center ms-auto">
                  
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/user.png" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex"><%=user%></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">Mi perfil</a>
                            <a href="#" class="dropdown-item">Ajustes</a>
                            <a href="#" class="dropdown-item">Salir</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <div style="margin-left: auto; margin-right: auto; margin-top: 10%" class="col-sm-12 col-xl-6">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">NUEVO TRABAJADOR</h6>
                            <form action="AGREGAR_TRABAJADOR.jsp?admin=<%=user%>" method="post" name="form">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">NOMBRE</label>
                                    <input type="text" placeholder="NOMBRE" name="nombre" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                    <br>
                                    
                                    <input style="width: 45%; float: left" placeholder="PUESTO" name="puesto" type="text" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                
                                    
                                    <input style="width: 45%; float: right " placeholder="FECHA CONTRATACIÓN" name="fecha" type="date" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                    
                                    <br>
                                    <br>
                                    <br>
                                    
                                    <input style="width: 45%; float: left" placeholder="SALARIO" name="salario" type="number" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                
                                    
                                    <select style="width: 45%; float: right" name="horas" class="form-select mb-3" aria-label="Default select example">
                                        <option selected>HORAS POR SEMANA</option>
                                        <option value="40">40 (TIEMPO COMPLETO)</option>
                                        <option value="20">20 (TIEMPO PARCIAL)</option>
                                    </select>
                                    
                                     <br>
                                    <br>
                                    <br>
                                    
                                    <fieldset  class="row mb-3">
                                    <legend class="col-form-label col-sm-2 pt-0">TURNO</legend>
                                    <div  class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios1" value="mañana" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                                MAÑANA
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios2" value="tarde">
                                            <label class="form-check-label" for="gridRadios2">
                                                TARDE
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gridRadios"
                                                id="gridRadios2" value="noche">
                                            <label class="form-check-label" for="gridRadios2">
                                                NOCHE
                                            </label>
                                        </div>
                                    </div>
                                </fieldset>
                                
                                    
                                    <input style="width: 45%; float: right " placeholder="DESEMPEÑO" name="evaluacion" type="text" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp">
                                   
                                </div>
                                <br>
                                <br>
                                <button type="submit" class="btn btn-primary">AGREGAR</button>
                            </form>
                        </div>
                    </div>
                    <br><br>
                    <%
                    
                    Connection conx = null;
                    Statement stat = null;
                    ResultSet result = null;
                    
                    try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conx = DriverManager.getConnection("jdbc:mysql://localhost/dennoun?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                    stat = conx.createStatement();
                } catch (SQLException error) {
                    System.out.println("NO SE PUDO CONECTAR");
                    System.out.println(error.getMessage());
                }
                
                try{
                    
                    result = stat.executeQuery("select*from personal");
                    
                    
                    %>
                   <div style="padding-left: 5%; padding-right: 5%" class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">REGISTROS</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">n. TRABAJADOR</th>
                                            <th scope="col">NOMBRE</th>
                                            <th scope="col">PUESTO</th>
                                            <th scope="col">SALARIO</th>
                                            <th scope="col">CONTRATACIÓN</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        
                                            while(result.next()){
                                        
                                        %>
                                        <tr>
                                            <th scope="row"><%=result.getString("id_empleado")%></th>
                                            <td><%=result.getString("nombre_empleado")%></td>
                                            <td><%=result.getString("puesto")%></td>
                                            <td>$ <%=result.getString("salario")%></td>
                                            <td><%=result.getString("fecha_contratacion")%></td>
                                        </tr>
                                        <%  }}catch (SQLException error) {
                                                out.print(error.toString());
                                            }
                                            conx.close();
                                            stat.close();
                                            result.close();%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">DENNOUN</a>, Derechos Reservados. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Diseñado por <a href="https://htmlcodex.com">DENNOUN</a>
                            <br>Distribuido por: <a href="https://themewagon.com" target="_blank">DENNOUN</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
