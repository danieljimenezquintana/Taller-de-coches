<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Garaje</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <style>
            body{
                background-image: url(img/fondo.jpg);
                background-size: cover;
                color: white;
            }
            body h1{
                color: lime;
            }
            body h4{
                size :1.5 vw;
                text-align: right;
                padding-right: 10px;
                color: white;
            }
            body.btn{
                color: red;
            }
            #wrapper{
                background-color: rgba(51,51,51,0.85);
                border-radius: 25px;
                text-align: center;
                left: 25%;
                margin: 2%;
                padding: 2%;  
            }
            form{
                position: relative;
                left: 25%;
                width:25vw;
            }
        </style>
    </head>
    <body class="text-center">
        <div id="wrapper">
            <h1><i>GAS GORILA MOTOR</i></h1>

            <%
                request.setCharacterEncoding("UTF-8");

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/coches", "root", "");
                Statement s = conexion.createStatement();

                ResultSet listado = s.executeQuery("SELECT * FROM coches");
                String estado = (request.getParameter("id") == null) ? "listado" : "editar";
            %>
            <h4>
                <%
                out.print(session.getAttribute("userid")); 
                %>
                <a href="cerrarsesion.jsp"><i style="color:red" class="fas fa-sign-out-alt" type="btn"></i></a>
            </h4>
            
            <table class="table">
                <tr><th></th><th>Marca</th><th>Modelo</th><th>Motor</th><th>Año de fabricación</th><th></th></tr>
                <form action="<%= estado.equals("listado") ? "nuevovehiculo.jsp" : "actualizarvehiculo.jsp"%>">
                    <tr></tr>
                    <td>
                        <div class="form-group">
                            <input hidden name="id" type="text" class="form-control" value="<%=estado.equals("editar") ? request.getParameter("id") : ("")%>">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input name="marca" required type="text" class="form-control" value="<%=estado.equals("editar") ? request.getParameter("marca") : ("")%>">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input name="modelo" required type="text" class="form-control" value="<%=estado.equals("editar") ? request.getParameter("modelo") : ("")%>">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input name="motor" step="100" type="number" min="0" required class="form-control" value="<%=estado.equals("editar") ? request.getParameter("motor") : ("")%>">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input name="anofabric" type="number" required class="form-control"  min="1000" value="<%=estado.equals("editar") ? request.getParameter("anofabric") : ("")%>">
                        </div>
                    </td>
                    <td>
                        <% if (estado.equals("listado")) {
                        %>
                        <button type="submit" class="btn btn-primary">Añadir</button>
                        <%
                            }
                            if (estado.equals("editar")) {
                        %>
                        <a href="actualizarvehiculo.jsp?id=<%= request.getParameter("id")%>&marca=<%= request.getParameter("marca")%>&modelo=<%= request.getParameter("modelo")%>&motor=<%= request.getParameter("motor")%>&anofabric=<%= request.getParameter("anofabric")%>"><button type="submit" class="btn btn-success">Guardar</button></a>
                        <a href="index.jsp"><button type="button" class="btn btn-dark">Cancelar</button></a>
                        <%
                            }
                        %>

                    </td>
                </form>
                <%
                    while (listado.next()) {
                %>
                <tr>
                    <td></td>
                    <td><%=listado.getString("marca")%></td>
                    <td><%=listado.getString("modelo")%></td>
                    <td><%=listado.getString("motor")%></td>
                    <td><%=listado.getString("anofabric")%></td>
                    <td>
                        <a class="btn btn-warning" href="index.jsp?id=<%= listado.getString("id")%>&marca=<%= listado.getString("marca")%>&modelo=<%= listado.getString("modelo")%>&motor=<%= listado.getString("motor")%>&anofabric=<%= listado.getString("anofabric")%>" role="button">Modificar</a>
                        <a class="btn btn-danger" href="borravehiculo.jsp?id=<%=listado.getString("id")%>" role="button">Borrar</a>
                        <a class="btn btn-info" <%=estado.equals("editar") ? "hidden" : ""%> href="reparar.jsp?id=<%=listado.getString("id")%>" role="button">Reparaciones</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
