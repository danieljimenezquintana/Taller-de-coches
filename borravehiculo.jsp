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
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/coches", "root", "");
      Statement s = conexion.createStatement();
      
      String borrado = "DELETE FROM coches WHERE id=";
      borrado += request.getParameter("id");
      
      //out.print(borrado);
      s.execute(borrado);
      conexion.close();
    %>
    
    <script>
      // Redirecciona a la página principal
      location.replace("Pagprin.jsp");
    </script>
  </body>
</html>

