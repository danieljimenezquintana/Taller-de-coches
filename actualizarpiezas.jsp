<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Garaje</title>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/coches", "root", "");
      Statement s = conexion.createStatement();

      String actualizacion = "UPDATE piezas SET piezas='";
      actualizacion += request.getParameter("piezas");
      actualizacion += "', id_coche='";
      actualizacion += request.getParameter("id_coche");
      actualizacion += "', descripcion='";
      actualizacion += request.getParameter("descripcion");
      actualizacion += "' WHERE id=";
      actualizacion += request.getParameter("id");

      out.print(actualizacion);
      //s.execute(actualizacion);
      //conexion.close();
    %>

    <script>
      // Redirecciona a la página principal
      //location.replace("reparar.jsp?id=<%=request.getParameter("id_coche")%>");
    </script>
  </body>
</html>