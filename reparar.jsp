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
        <style>
            body{
                background-image: url(img/fondo.jpg);
                background-size: cover;
                color: white;
            }
            body h1{
                color: lime;
            }
            #wrapper{
                background-color: rgba(51,51,51,0.85);
                border-radius: 25px;
                text-align: center;
                left: 25%;
                margin: 2%;
                padding: 2%;  
            }
        </style>
    </head>
    <body class="text-center">
        <div id="wrapper">


            <%
                request.setCharacterEncoding("UTF-8");

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/coches", "root", "");
                Statement s = conexion.createStatement();

                int idCoche = Integer.parseInt(request.getParameter("id"));
                ResultSet listado = s.executeQuery("SELECT * FROM piezas WHERE id_coche = " + idCoche);
                String estado = (request.getParameter("piezas") == null) ? "listado" : "editar";
            %>
            <h1><i>GAS GORILA MOTOR</i></h1>
            <table class="table">
                <tr><td>Pieza</td><td>Problema</td><td></td><td></td></tr>
                <form action="<%= estado.equals("listado") ? "nuevapieza.jsp" : "actualizarpiezas.jsp"%>">
                    <tr>
                        <td>
                            <div class="form-group">
                                <input 
                                    name="piezas" 
                                    type="text" 
                                    required
                                    class="form-control" 
                                    value="<%=estado.equals("editar") ? request.getParameter("piezas") : ""%>">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <input name="descripcion" required type="text" class="form-control" value="<%=estado.equals("editar") ? request.getParameter("descripcion") : ""%>">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <input name="id_coche"
                                       type="text" 
                                       class="form-control" 
                                       value="<%=request.getParameter("id")%>"
                                       hidden>
                            </div>
                        </td>
                        <td class="text-right">
                            <% if (estado.equals("listado")) {
                            %>
                            <button type="submit" class="btn btn-primary">Añadir</button>
                            <%
                                }
                                if (estado.equals("editar")) {
                            %>
                            <a href="actualizarpiezas.jsp?id=<%= request.getParameter("id")%>&piezas=<%= request.getParameter("piezas")%>&id_coche=<%= request.getParameter("id_coche")%>&descripcion=<%= request.getParameter("descripcion")%>"><button type="submit" class="btn btn-success">Guardar</button></a>
                            <a href="reparar.jsp?id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-dark">Cancelar</button></a>
                            <%
                            }%>
                        </td>
                    </tr>
                </form>
                <%
                    while (listado.next()) {
                %>
                <tr>
                    <td><%=listado.getString("piezas")%></td>
                    <td><%=listado.getString("descripcion")%></td>
                    <td></td>
                    <td class="text-right">
                        <a class="btn btn-danger" href="borrarpiezas.jsp?id=<%=listado.getString("id")%>&id_coche=<%=listado.getString("id_coche")%>" role="button">Borrar</a>
                        <!--<a class="btn btn-info" href="reparar.jsp?id=<%=listado.getString("id_coche")%>&id_coche=<%=listado.getString("id_coche")%>&piezas=<%=listado.getString("piezas")%>&descripcion=<%=listado.getString("descripcion")%>" role="button">Editar</a>-->
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <a href="index.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
        </div>
    </body>
</html>
