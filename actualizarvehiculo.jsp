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

      String actualizacion = "UPDATE coches SET marca='";
      actualizacion += request.getParameter("marca");
      actualizacion += "', modelo='";
      actualizacion += request.getParameter("modelo");
      actualizacion += "', motor='";
      actualizacion += request.getParameter("motor");
      actualizacion += "', anofabric='";
      actualizacion += request.getParameter("anofabric");
      actualizacion += "' WHERE id=";
      actualizacion += request.getParameter("id");

      //out.print(actualizacion);
      s.execute(actualizacion);
      conexion.close();
    %>

    <script>
      // Redirecciona a la página principal
      location.replace("index.jsp");
    </script>
  </body>
</html>

